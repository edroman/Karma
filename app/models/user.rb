class User < ActiveRecord::Base
  has_many :emails
  has_many :queries
  # Since the user already has_many queries, so we need to explicitly define the foreign key relationship
  has_many :mentored_queries, :class_name => "Query", :foreign_key => "mentor_id"

  validates_presence_of :name
  validates_uniqueness_of :email, :case_sensitive => false
  #validates_format_of :address, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,}$/i TODO: Validate the email when there is an email but not when creating from omniauth.

	def self.create_with_omniauth(auth)
	  create! do |user|
	    user.provider = auth["provider"]
	    user.uid = auth["uid"]
	    user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.token = auth["credentials"]["token"]
      user.secret = auth["credentials"]["secret"]
	  end
  end

  def first_name
    name.sub(/ .*/, '') rescue ''
  end

  def is_mentor?
    return member == "administrators" || member == "mentors"
  end

  def has_open_queries?
    !queries.where(:status => 'open').blank?
  end
end
