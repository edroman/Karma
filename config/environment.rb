# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Karma::Application.initialize!

# Configure mailer (specific to this app))
# :domain is set in the environment files specific to production/development/staging
ActionMailer::Base.smtp_settings[:user_name] = "karma"            # MailGun: edward.w.roman@gmail.com
ActionMailer::Base.smtp_settings[:password] = "reputation"
ActionMailer::Base.smtp_settings[:address] = "smtp.sendgrid.net"  # MailGun: smtp.mailgun.org
ActionMailer::Base.smtp_settings[:port] = 587
ActionMailer::Base.smtp_settings[:authentication] = :plain
ActionMailer::Base.smtp_settings[:enable_starttls_auto] = true

# Register the mail interceptor so that development mode emails aren't actually sent
require 'development_mail_interceptor'
if  Rails.env.development?
  # ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
  NotifierMailer.register_interceptor(DevelopmentMailInterceptor)
end
