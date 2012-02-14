require 'spec_helper'

describe MainController do

  describe "home" do
    describe "not logged in" do
      before do
        controller.stub!(:current_user).and_return(nil)
        get :home
      end
      it { should respond_with :success }
      it { should render_template :home }
    end

    describe "logged in with no needs" do
      before do
        @user = Factory :user
        controller.stub!(:current_user).and_return(@user)
        get :home
      end
      it { should_not respond_with :success }
      it { should redirect_to new_need_path }
    end

    describe "logged in with a need" do
      before do
        @user = Factory :user
        @need = Factory :need, :user_id => @user.id
        controller.stub!(:current_user).and_return(@user)
        get :home
      end
      it { should_not respond_with :success }
      it { should redirect_to thanks_needs_path }
    end
  end
end