class MainController < ApplicationController

  # The root is redirected to this in routes.rb.
  # Since this inherits from ApplicationController it will make sure user is logged in first.
  def home
    if current_user
      if current_user.has_needs?
        redirect_to thanks_needs_path
      else
        flash.keep
        redirect_to new_need_path
      end
    end
  end

end