class UsersController < ApplicationController

  before_filter :authenticate
  before_filter :sign_up_next_step, :except => [:add_email, :update]

  def add_email
    @user = current_user
  end

  # this update method applies to the add_email form
  def update
    @user = current_user

    # If the PUT parameters validate into usable fields for "user"...
    if (@user && @user.update_attributes(params[:user]))
      redirect_to root_path, :notice => "Success! w00t w00t!"
    # If there's an error, then it must have come from the add_email form since that actually has fields.
    else
      render action: "add_email"
    end
  end

end