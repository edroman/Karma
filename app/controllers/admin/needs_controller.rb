class Admin::NeedsController < Admin::BaseController

  before_filter :authenticate, :except => :index

  def index
    @needs = Need.all
  end

  def show
    @need = Need.find(params[:id])
  end

  def new
    @need = Need.new
    @need.user_id = session[:user_id]
  end

  def edit
    @need = Need.find(params[:id])
  end

  def create
    @need = Need.new(params[:need])
    @need.user_id = session[:user_id]

    if @need.save
      redirect_to admin_need_path(@need), notice: 'Need was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @need = Need.find(params[:id])

    if @need.update_attributes(params[:need])
      redirect_to admin_need_path(@need), notice: 'Need was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @need = Need.find(params[:id])
    @need.destroy

    redirect_to admin_needs_url
  end
end