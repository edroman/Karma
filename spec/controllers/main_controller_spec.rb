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

    describe "logged in with no queries" do
      before do
        @user = Factory :user, :house_rules => true
        controller.stub!(:current_user).and_return(@user)
        get :home
      end
      it { should_not respond_with :success }
      it { should redirect_to new_query_path }
    end

    describe "logged in with an open query" do
      before do
        @user = Factory :user, :house_rules => true
        @query = Factory :query, :user_id => @user.id, :status => "open"
        controller.stub!(:current_user).and_return(@user)
        get :home
      end
      it { should_not respond_with :success }
      it { should redirect_to thanks_queries_path }
    end
  end
end