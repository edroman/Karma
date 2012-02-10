class IncomingMailController < ActionController::Base
  def post_event
    # Logging
    puts "Incoming post event from mail server!"
    puts "params[:recipient] = #{params[:recipient]}"
    puts "params[:sender] = #{params[:sender]}"
    puts "params[:subject] = #{params[:subject]}"
    puts "params[:from] = #{params[:from]}"
    puts "params[:received] = #{params[:received]}"
    puts "params[:body-plain] = #{params["body-plain"]}"
    puts "params[:body-html] = #{params["body-html"]}"

    # Read in the "recipient" parameter, which should be a mangled email address storing query and user info
    mangled_address = MangledEmailAddress.new
    mangled_address.populate_from_string(params[:recipient])

    # Swap the to_user and the from_user, since the email was just replied to
    to_user = mangled_address.from_user
    from_user = mangled_address.to_user

    # Send the email to the recipient
    # TODO: Figure out whether we should be doing body-html, not just body-plain
    from_address = MangledEmailAddress.new
    from_address.populate_from_params(mangled_address.query, from_user, !mangled_address.is_from_mentor)
    NotifierMailer.forward_reply(from_user, to_user, from_address, params[:subject], params["body-plain"], mangled_address.query).deliver

    # Return an HTTP Status OK 200 message to the mail server that sent us the POST request, since otherwise
    # we'll render an empty template
    head 200
  end
end
