class UsersController < ApplicationController

  before_filter :authenticate
  before_filter :sign_up_next_step, :except => [:add_email, :update]

  def add_email
    @user = current_user
  end

  # this update method applies to the add_email and new_need form
  def update
    @user = current_user

    # If the PUT parameters validate into usable fields for "user"...
    if (@user && @user.update_attributes(params[:user]))
      redirect_to root_path, :notice => "Success! w00t w00t!"
    # If there's an error, then it must have come from the add_email or new_need form since that actually has fields.
    else
      # TODO: This is a hack.. need to probably break this controller out into multiple controllers to solve this with intelligent errors.
      redirect_to :back, :notice => "Form has errors - please try again."
    end
  end

end