class Query < ActiveRecord::Base
  belongs_to :user
  belongs_to :mentor, :class_name => "User"
  has_many :emails

  validates_presence_of :user_id
  validates_presence_of :question
  validates_length_of :question,
                      :minimum => 20,
                      :too_short => "is very short. Please include enough information so we can tell who the best person to answer would be."
end
