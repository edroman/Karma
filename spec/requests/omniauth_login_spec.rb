require 'spec_helper'

describe 'authenticate with facebook' do

  describe 'using valid credentials' do
    before do
      OmniAuth.config.mock_auth[:facebook] = { 'info' => { 'name' => 'Mario Brothers', 'image' => '', 'email' => 'dpsk@email.ru' },
                                               'uid' => '123545',
                                               'provider' => 'facebook',
                                               'credentials' => {'token' => 'token'},
                                               'extra' => { 'user_hash' => {} } }
    end

    it "should log in" do
      login_with_oauth
      page.should have_content("Sign out")
      page.should have_content("Mario Brothers")
    end

    it "should log out" do
      login_with_oauth
      click_link 'Sign out'
      page.has_css?(".sign_up").should be true
    end
  end

  describe 'using invalid credentials' do
    before do
      OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    end

    it 'should not log in' do
      login_with_oauth
      page.should_not have_content("Sign out")
      page.has_css?(".sign_up").should be true
    end
  end
end

describe 'authenticate with twitter' do
  describe 'using valid credentials' do
    before do
      OmniAuth.config.mock_auth[:twitter] = {
        'info' => { 'name' => 'Mario Brothers', 'image' => '', 'nickname' => 'Louige' },
        'uid' => '123545',
        'provider' => 'twitter',
        'credentials' => {'token' => 'token', 'secret' => 'secret'},
        'extra' => { 'user_hash' => {} }
        }
    end

    it "should log in" do
      login_with_oauth(:twitter)
      page.should have_content("Sign out")
      page.should have_content("Mario Brothers")
    end

    it "should logs out" do
      login_with_oauth(:twitter)
      click_link 'Sign out'
      page.has_css?(".sign_up").should be true
    end
  end

  describe 'using invalid credentials' do
    before do
      OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
    end

    it 'should not log in' do
      login_with_oauth(:twitter)
      page.should_not have_content("Sign out")
      page.has_css?(".sign_up").should be true
    end
  end
end