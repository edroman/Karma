class Admin::QueriesController < Admin::BaseController

  before_filter :authenticate, :except => :index

  def index
    @queries = Query.all
  end

  def show
    @query = Query.find(params[:id])
  end

  def new
    @query = Query.new
    @query.user_id = session[:user_id]
  end

  def edit
    @query = Query.find(params[:id])
  end

  def create
    @query = Query.new(params[:query])
    @query.user_id = session[:user_id]

    if @query.save
      redirect_to admin_query_path(@query), notice: 'Query was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @query = Query.find(params[:id])

    if @query.update_attributes(params[:query])
      redirect_to admin_query_path(@query), notice: 'Query was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @query = Query.find(params[:id])
    @query.destroy

    redirect_to admin_queries_url
  end
end