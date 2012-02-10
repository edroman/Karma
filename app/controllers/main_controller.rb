class MainController < ApplicationController

  def home
    if current_user
      if current_user.has_open_queries?
        redirect_to thanks_queries_path
      else
        flash.keep
        redirect_to new_query_path
      end
    end
  end

end