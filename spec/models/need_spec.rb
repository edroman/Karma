require "spec_helper"

describe Need do

  before(:each) do
    @need = Factory :need
  end

  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :mentor }
    it { should have_many :emails }
  end

  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :body }
    #it { should validate_length_of :body, :minimum => 20 } # TODO: Spec should work but NoMethod
    it { should validate_format_of(:body).not_with('1234567890123456789').with_message(/short/) }
    it { should validate_format_of(:body).with('12345678901234567890') }
  end

  describe "attributes" do
    it { should respond_to :user_id }
    it { should respond_to :mentor_id }
    it { should respond_to :body }
  end

  describe "methods" do
  end
end

