class ApplicationController < ActionController::Base
  protect_from_forgery

	helper_method :current_user, :authenticate

	private

  # This encapsulates access to session[:user_id] and is called from children
  # Since ActiveRecord caches, there's no performance hit.  No reason to ever call session[:user_id] directly
	def current_user
    # Uncomment this to reset the session:
    # reset_session

	  @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def sign_up_next_step
    if current_user.email.blank?
      redirect_to add_email_path, :notice => "You signed up, but this site doesn't work without your email!"
    end
  end

  def authenticate
    redirect_to root_path, :alert => "Sorry, you don't have access!" unless current_user
  end

end
