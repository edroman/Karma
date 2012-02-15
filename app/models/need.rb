class Need < ActiveRecord::Base
  belongs_to :user
  belongs_to :mentor, :class_name => "User"
  has_many :emails

  validates_presence_of :user_id
  validates_presence_of :body
end
