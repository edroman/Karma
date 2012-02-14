require 'spec_helper'

describe NeedsController do

  render_views

  describe "on GET to :new" do

    before do
      @user = Factory :user
      controller.stub!(:current_user).and_return(@user)
      get :new
    end

    it { should respond_with :success }
    it { should render_template :new }
    it { should initialize @need }
    it { should assign_to(:need).with kind_of Need }
  end

  describe "create" do
    describe "valid need" do
      before do

        # Make a temporary user
        @user = Factory :user

        # Create a temporary method: NeedController.current_user() which just returns @user rather than using the session
        controller.stub!(:current_user).and_return(@user)

        @body = "The planet is fine, the people are fucked"

        # Perform an HTTP Post on the controller
        post :create, :need => { :body => @body }
      end

      it { should redirect_to thanks_needs_path }
      it { should initialize @need }
      it { should assign_to(:need).with kind_of Need }
    end

    describe "invalid need" do
      before do
        @user = Factory :user
        controller.stub!(:current_user).and_return(@user)
        @body = "The planet"
        post :create, :need => { :body => @body }
      end

      it { should respond_with :success }
      it { should render_template :new }
      it { should initialize @need }
    end
  end

  describe "thanks" do
    before do
      @user = Factory :user
      controller.stub!(:current_user).and_return(@user)
      get :thanks
    end
    it { should respond_with :success }
    it { should render_template :thanks }
  end
end