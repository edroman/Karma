require "spec_helper"

describe Query do

  before(:each) do
    @query = Factory :query
  end

  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :mentor }
    it { should have_many :emails }
  end

  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :question }
    #it { should validate_length_of :question, :minimum => 20 } # TODO: Spec should work but NoMethod
    it { should validate_format_of(:question).not_with('1234567890123456789').with_message(/short/) }
    it { should validate_format_of(:question).with('12345678901234567890') }
  end

  describe "attributes" do
    it { should respond_to :user_id }
    it { should respond_to :mentor_id }
    it { should respond_to :question }
    it { should respond_to :status }
  end

  describe "methods" do
  end
end

