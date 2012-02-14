class MainController < ApplicationController

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