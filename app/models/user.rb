class User < ActiveRecord::Base
  has_many :emails

  # This stuff is required to allow parent to update children.  Useful for view that has multiple needs being edited in 1 form.
  # Note that the needs_attributes= writer method is required for fields_for to correctly identify :needs as a collection, and the correct indices to be set in the form markup.
  has_many :needs
  accepts_nested_attributes_for :needs, :allow_destroy => true, :reject_if => lambda { |a| a[:content].blank? }
  def needs_attributes=(attributes)
    # Process the attributes hash
  end

  # Since the user already has_many needs, so we need to explicitly define the foreign key relationship
  has_many :helped_needs, :class_name => "Need", :foreign_key => "helper_id"

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

  def has_needs?
    !needs.blank?
  end

end
