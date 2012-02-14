require File.dirname( __FILE__ ) + '/../../config/environment'
require 'shell'

include Shell

if Rails.env.development?

  TARGETS = %w[ production staging ]

  namespace :heroku do

    desc "Clone DB from heroku app to localhost"
    task :pull do
      target = ENV['TARGET'] || TARGETS.first
      execute "rake db:drop db:create RAILS_ENV=#{Rails.env}"
      execute "heroku db:pull --app #{app}-#{target} --confirm #{app}-#{target}"
    end

    desc "Clone DB from localhost to heroku app"
    task :push do
      target = ENV['TARGET'] || raise( 'please pass in TARGET')
      raise 'Refusing to push db to production' if target=='prod' || target=='production'
      execute "heroku rake db:reset --app #{app}-#{target}"
      execute "heroku db:push --app #{app}-#{target} --confirm #{app}-#{target}"
    end

    desc 'make new app instance on heroku using TARGET=<eg static1>'
    task :create do
      ENV[ 'TARGET' ] ? targets = [ ENV[ 'TARGET' ] ] : targets = ['staging','production']
      tld = ENV[ 'TLD' ] || "com"
      stack = ENV[ 'STACK' ] || "cedar"

      targets.each do |target|
        heroku_app = "#{app}-#{target}"
        execute("heroku create #{heroku_app} --stack #{stack}", :continue_on_failure => true)
        ['custom_domains',
         'logging:expanded',
         'releases:basic',
         'pgbackups:auto-month'].each { |addon| add_addon(addon, heroku_app)}
        execute("heroku addons:add deployhooks:email --app #{heroku_app} recipient=edward.w.roman@gmail.com subject='[Heroku] {{app}} deployed to #{target}' body='{{user}} deployed {{head}} to {{url}} with {{git_log}}'", :continue_on_failure => true)
        execute("heroku domains:add #{target}.#{app}.#{tld} --app #{heroku_app}", :continue_on_failure => true)
        if target == 'production'
          execute("heroku domains:add www.#{app}.#{tld} --app #{heroku_app}", :continue_on_failure => true)
        end
      end
    end

    def add_addon(addon, heroku_app)
      execute("heroku addons:add #{addon} --app #{heroku_app}")
    rescue
      execute("heroku addons:upgrade #{addon} --app #{heroku_app}", :continue_on_failure => true)
    end

  end
end