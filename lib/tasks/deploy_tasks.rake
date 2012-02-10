require File.dirname( __FILE__ ) + '/../../config/environment'
require 'shell'

include Shell

if Rails.env.development?

  TARGETS = %w[ production staging ]

  namespace :deploy do

    task :default => ["staging"]

    desc "Deploy from REF=<ref> TARGET=<#{TARGETS.join('|')}>"
    task :production => :environment do
      ref = ENV['REF'] || 'master'
      target = ENV['TARGET'] || TARGETS.first
      push_to_remote( target, ref )
      execute( "heroku run rake --trace db:migrate                 --app #{app}-#{target}" )
      execute( "heroku restart                                 --app #{app}-#{target}" )
      execute( "heroku run rake --trace db:seed                    --app #{app}-#{target}" )
#      execute( "rake airbrake:deploy TO=#{target}" )
    end

    desc "Deploy to Staging from REF=<ref> TARGET=<#{TARGETS.join('|')}>"
    task :staging => :environment do
      ref = ENV['REF'] || 'master'
      target = ENV['TARGET'] || TARGETS.second
      push_to_remote( target, ref )
      execute( "heroku pgbackups:capture --expire                        --app #{app}-#{target}" )
      execute( "heroku pgbackups:capture --expire                        --app #{app}-production" )
      execute( "heroku pg:reset SHARED_DATABASE                          --app #{app}-#{target} --confirm #{app}-#{target}" )
      execute( "heroku pgbackups:restore DATABASE `heroku pgbackups:url  --app #{app}-production` --app #{app}-#{target} --confirm #{app}-#{target}" )
      execute( "heroku run rake --trace db:migrate                           --app #{app}-#{target}" )
      execute( "heroku restart                                           --app #{app}-#{target}" )
      execute( "heroku run rake --trace db:seed                              --app #{app}-#{target}" )
#      execute( "rake airbrake:deploy TO=#{target}" )
    end

    def push_to_remote( target, ref )
      # add remote in case this dev box doesn't have it yet, makes it easier to track, eg in gitx
      git_remote = "heroku-#{app}-#{target}"
      unless `git remote`.match( /\b#{git_remote}\b/ )
        execute( "git remote add #{git_remote} git@heroku.com:#{app}-#{target}.git" )
      end

      # deploy release branch: always *to* heroku "master" branch
      execute( "git push --force #{git_remote} #{ref}:master" )
    end

    def app
      ENV[ 'APP' ] || File.expand_path( Rails.root ).split( '/' ).last
    end

  end

end