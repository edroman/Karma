require "spec_helper"

describe User do

  before(:each) do
    @user = Factory(:user)
  end

  describe "validations" do
    it { should validate_format_of(:email).not_with('test@test').with_message(/invalid/) }
    it { should validate_format_of(:email).with('test@test.com') }
  end

  describe "methods" do
    describe "create_with_omniauth" do
      before do
        @name = "Mario Brothers"
        @uid = "12345"
        @provider = 'twitter'
        @token = '67890'
        @secret = 'hush'
        auth = { 'info' => { 'name' => @name, 'image' => '', 'nickname' => 'Louige' },
                 'uid' => @uid,
                 'provider' => @provider,
                 'credentials' => {'token' => @token, 'secret' => @secret},
                 'extra' => { 'user_hash' => {} } }
        @user = User.create_with_omniauth(auth)
      end
      it { should be_true }
      it { User.last.name.should == @name }
      it { User.last.uid.should == @uid }
      it { User.last.provider.should == @provider }
      it { User.last.image.should == @image }
      it { User.last.token.should == @token }
      it { User.last.secret.should == @secret }

    end

    describe "first_name" do
      it { should respond_to :first_name }
      it { @user.name.should include @user.first_name }
      it { @user = Factory(:user, :name => "John Smith")
           @user.first_name.should == "John" }
    end

    describe "is_mentor?" do
      it { should respond_to :is_mentor? }
      it { @user = Factory(:user, :member => "administrators")
           @user.is_mentor?.should be_true }
      it { @user = Factory(:user, :member => "mentors")
           @user.is_mentor?.should be_true }
      it { @user = Factory(:user, :member => "party guys")
           @user.is_mentor?.should be_false }
      it { @user = Factory(:user, :member => nil)
           @user.is_mentor?.should be_false }
    end

    describe "has_open_queries?" do
      it { should respond_to :has_open_queries? }

      describe "user has open queries" do
        it { @query = Factory :query, :status => "open"
             @query.user.has_open_queries?.should be_true }
      end

      describe "user has no open queries" do
        it { @user.has_open_queries?.should be_false }
        it { @query = Factory :query, :status => "closed"
             @query.user.has_open_queries?.should be_false }
      end
    end

  end

end