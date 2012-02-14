class Admin::EmailsController < Admin::BaseController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
  end

  def new
    @email = Email.new
  end

  def edit
    @email = Email.find(params[:id])
  end

  def create
    @email = Email.new(params[:email])

    if @email.save
      redirect_to admin_email_path(@email), notice: 'Email was successfully created.'
    else
      render action: "new"
    end

  end

  def update
    @email = Email.find(params[:id])

    if @email.update_attributes(params[:email])
      redirect_to admin_email_path(@need), notice: 'Email was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    redirect_to admin_emails_url
  end
end
