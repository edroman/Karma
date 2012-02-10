class NotifierMailer < ActionMailer::Base

  self.default :from => "karma@karma.mailgun.org"

  # send a sign up email to the user, pass in the user object that contains the user's email address
  # the body comes from the HAML template
  def sign_up(user)
    @user = user

    mail(:to => user.email, :subject => "Thanks for signing up to Karma!")
  end

  # send an email to the administrators to let us know about a new query, so we can assign it to a mentor
  def admin_new_query_alert(query)
    mail(:to => "edward.w.roman@gmail.com, karma@trikro.com",
         :subject => "New Karma Query!",
         :body => "User: #{query.user.name}\nEmail: #{query.user.email}\nQuery: #{query.question}")
  end

  # When a mentor has been assigned a query, send an email TO the mentor FROM the user
  def query_assigned(query)

    # Populate member variable so that the view can access it
    @query = query

    # Combine the query_id and user_id into a mangled email address to be used as the "from" address
    address = MangledEmailAddress.new
    address.populate_from_params(query, query.user, false)

    # Send out email.  Body comes from template.
    result = mail(:from => address.to_s,
                  :to => query.mentor.email,
                  :subject => "You've received a startup question!")

    # Create email object in database and persist it
    email = Email.new
    email.subject = result.subject
    email.body_plain = result.body
    email.body_html = result.body
    email.sender_id = query.user.id
    email.receiver_id =query.mentor.id
    email.query_id = query.id
    email.save

    return result
  end

  # Called by POST listener when emails are replied to
  def forward_reply(from_user, to_user, from_mangled_address, subject, body, query)

    # Send out email
    result = mail(:from => from_mangled_address,
                  :to => to_user.email,
                  :subject => ("Re: " + subject),
                  :body => body)

    # Create email object in database and persist it
    email = Email.new
    email.subject = result.subject
    email.body_plain = result.body
    email.body_html = result.body
    email.sender_id = from_user.id
    email.receiver_id = to_user.id
    email.query_id = query.id
    email.save

    return result
  end

  private

  # Helper method
  def send_email(params = {})

    # Send out email.  Body comes from template.
    result = mail(:from => params[:from],
                  :to => params[:to],
                  :subject => params[:subject])

    # Create email object in database and persist it
    email = Email.new
    email.subject = params[:subject]
    email.body_plain = result.body_plain
    email.body_html = result.body_html
    email.sender_id = params[:sender_user].id
    email.receiver_id =params[:receiver_user].id
    email.query_id = params[:query].id
    email.save

    return result
  end

end
