require 'spec_helper'

describe UsersController do

  render_views

  describe "#add_email" do
    before do
      @current_user = Factory :user, :email => nil
      controller.stub!(:current_user).and_return(@current_user)
      get :add_email
    end
    it { should respond_with :success }
    it { should render_template :add_email }
    it { should initialize @user }
    it { should assign_to(:user).with_kind_of(User) }
  end

  describe "#update" do
    context "valid user" do
      before do
        @current_user = Factory :user
        controller.stub!(:current_user).and_return(@current_user)
        @current_user.stub!(:update_attributes).and_return(true)
        put :update, { :id => @current_user.id, :user => { :email => 'test@test.com' } }
      end
      it { should redirect_to root_path }
    end

    context "invalid user" do
      before do
#        @current_user = Factory :user
#        controller.stub!(:current_user).and_return(@current_user)
#        @current_user_with_errors = @current_user
#        @current_user_with_errors.errors.add :email, 'error'
#        @current_user.stub!(:update_attributes).and_return(@current_user_with_errors)
        controller.stub!(:current_user).and_return(nil)
        put :update, { :id => -1, :user => { :email => '' } }
      end
      it { should respond_with :success }
      it { should render_template :add_email }
    end

  end
end