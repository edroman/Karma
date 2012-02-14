class NeedsController < ApplicationController

  before_filter :authenticate, :sign_up_next_step

  def new
    @user = current_user

    max_needs.times do
      need = @user.needs.build
      need.user_id = @user.id
    end

  end

  def create
    success = true

    @user = current_user

    max_needs.times do
      need = @user.needs.build(params[:need])
      need.user_id = @user.id

      if !need.save
        success = false
      end
    end

    if (success)
      redirect_to thanks_needs_path, notice: 'Needs saved.'
    else
      render action: "new"
    end

  end

  def thanks
  end

end