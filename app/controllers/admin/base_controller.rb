class Admin::BaseController < ApplicationController

  before_filter :verify_admin

  private

  def current_user

    # Uncomment this to reset the session:
    # reset_session

    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def verify_admin
    user = current_user
    if !user || user.member != "administrators"
      redirect_to root_path, :notice => "Sorry, you need to be a logged-in administrator to view this!"
    end
  end

end
