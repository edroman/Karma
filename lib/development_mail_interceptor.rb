# Re-routes emails that are sent in development mode
class DevelopmentMailInterceptor

  def self.delivering_email(message)
    message.subject = "[TEST email] To = " + message.to[0] + " Subject = " + message.subject
    message.to = "edward.w.roman@gmail.com"
  end

end
