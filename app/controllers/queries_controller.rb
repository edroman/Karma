class QueriesController < ApplicationController

  before_filter :authenticate, :sign_up_next_step

  def new
    @query = Query.new
    @query.user_id = current_user.id
  end

  def create
    @query = Query.new(params[:query])
    @query.user_id = current_user.id

    if @query.save
      redirect_to thanks_queries_path, notice: 'Your question has been created and is being fed into a mysterious black box.'
    else
      render action: "new"
    end
  end

  def thanks
  end

end