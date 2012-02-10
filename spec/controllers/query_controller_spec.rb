require 'spec_helper'

describe QueriesController do

  render_views

  describe "on GET to :new" do

    before do
      @user = Factory :user, :house_rules => true
      controller.stub!(:current_user).and_return(@user)
      get :new
    end

    it { should respond_with :success }
    it { should render_template :new }
    it { should initialize @query }
    it { should assign_to(:query).with kind_of Query }
  end

  describe "create" do
    describe "valid query" do
      before do

        # Make a temporary user
        @user = Factory :user, :house_rules => true

        # Create a temporary method: QueryController.current_user() which just returns @user rather than using the session
        controller.stub!(:current_user).and_return(@user)

        @question = "The planet is fine, the people are fucked"

        # Perform an HTTP Post on the controller
        post :create, :query => { :question => @question }
      end

      it { should redirect_to thanks_queries_path }
      it { should initialize @query }
      it { should assign_to(:query).with kind_of Query }
    end

    describe "invalid query" do
      before do
        @user = Factory :user, :house_rules => true
        controller.stub!(:current_user).and_return(@user)
        @question = "The planet"
        post :create, :query => { :question => @question }
      end

      it { should respond_with :success }
      it { should render_template :new }
      it { should initialize @query }
    end
  end

  describe "thanks" do
    before do
      @user = Factory :user, :house_rules => true
      controller.stub!(:current_user).and_return(@user)
      get :thanks
    end
    it { should respond_with :success }
    it { should render_template :thanks }
  end
end