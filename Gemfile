source 'http://rubygems.org'

# NOTE: This has only been tested on Ruby 1.9.2.  Ruby 1.9.3 has some issues since the debugger doesn't work yet.'

gem 'rails', '3.1.3'
#gem 'rake', '0.8.7'
gem 'rake', '0.9.2.2' # version set for debugging rspec within RubyMine generating a "missing constant RDoc" error
gem 'haml-rails' # TODO: DELETE
gem 'slim'
gem 'eventmachine', '1.0.0.beta.2' # version set for windows compatibility

#require 'v8' # required for ubuntu
#gem 'execjs' # required for ubuntu
#gem 'therubyracer' # required for Ubuntu

gem 'omniauth-twitter'
gem 'omniauth-linkedin'
gem 'omniauth-facebook'
gem 'jquery-rails'
gem 'airbrake' # Used to tell hoptoad that a new deploy occured...wipe old bugs.
#gem 'pg', '0.9.0'  # Allows talking to PG on heroku or local.  Set version for Windows compatibility, since new version of 'pg' doesn't make a native extension'.
gem 'pg'
gem 'thin'
gem 'rest-client' # For performing RESETful operations, e.g. MailGun
gem 'sendgrid'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'awesome_print' # Use 'ap' in the console to make output comprehensible
  gem 'heroku' # Allows heroku commands
  gem 'taps' # Allows pushing and pulling from heroku db.
  gem 'sqlite3'
end

group :test do
  gem 'turn', '0.8.2', :require => false # Pretty printed test output
end

group :development, :test do
#  gem 'ruby-debug19', :require => 'ruby-debug'
# For ubuntu:
#gem 'linecache19', '0.5.13', :path => "~/.rvm/gems/ruby-1.9.3-p#{RUBY_PATCHLEVEL}/gems/linecache19-0.5.13/"
  gem 'linecache19'
#gem 'ruby-debug-base19', '0.11.26', :path => "~/.rvm/gems/ruby-1.9.3-p#{RUBY_PATCHLEVEL}/gems/ruby-debug-base19-0.11.26/"
  gem 'ruby-debug-base19'
  gem 'ruby-debug19', :require => 'ruby-debug'
#  gem 'pry'
#  gem 'pry-remote'
#  gem 'pry-nav'

  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'rspec-rails', '2.7.0'  # RubyMine's rake isn't compatible with the newest version of rspec
  gem 'capybara'
  gem 'ffaker'
  gem 'fuubar'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'spork', '> 0.9.0.rc'
end
