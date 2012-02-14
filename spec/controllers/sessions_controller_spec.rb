require 'spec_helper'
require 'ruby-debug'

describe SessionsController do

  render_views

  describe "#create" do

    before :each do
      @sign_in_user = Factory :user

      @auth = {'info' => { 'name' => @sign_in_user.name, 'image' => '', 'nickname' => 'Louige' },
                                              'uid' => @sign_in_user.id,
                                              'provider' => @sign_in_user.provider,
                                              'credentials' => {'token' => 'token', 'secret' => 'secret'},
                                              'extra' => { 'user_hash' => {} } }
      controller.stub!(:get_auth).and_return(@auth)
      controller.request.env["omniauth.auth"] = @auth
      User.stub!(:find_by_provider_and_uid).and_return(@sign_in_user)
    end

    context "sign in successfully" do
      before { get :create, :provider => 'twitter' }
      it { session[:user_id].should == @sign_in_user.id }
      it { should redirect_to root_path }
    end

    context "sign up successfully" do
      before { get :create }
      it { session[:user_id].should == @sign_in_user.id }
      it { should redirect_to root_path }
    end
  end

  describe "#create -- sign up unsuccessfully" do
    before do
      controller.stub!(:get_auth).and_return( {:provider => nil, :uid => nil} )
      User.stub!(:find_by_provider_and_uid).and_return(nil)
      User.stub!(:create_with_omniauth).and_return(nil)
      get :create
    end
    it { session[:user_id].should == nil }
    it { should redirect_to root_path }
  end

  describe "#destroy" do
    before do
      session[:user_id] = 5
      delete :destroy
    end
    it { session.should == {} }
    it { should redirect_to root_path }
  end

  describe "#failure" do
    before do
      @user = Factory :user
      controller.stub!(:current_user).and_return(@user)
      get :failure
    end
    it { should redirect_to root_path }
  end

end