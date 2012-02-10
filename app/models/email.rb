class Email < ActiveRecord::Base
  belongs_to :query
  belongs_to :sender, :class_name => "User"
  belongs_to :receiver, :class_name => "User"

  validates_presence_of :sender
  validates_presence_of :receiver
  validates_presence_of :query
  validates_presence_of :subject
  validates_presence_of :body_plain
  validates_presence_of :body_html

end
