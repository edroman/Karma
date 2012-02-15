# creates a "from" email address that is a mix of fields
# The non-hash version of this is just for testing and debugging purposes to make it easier to see
class MangledEmailAddress

  attr_accessor :need, :from_user, :is_from_mentor

  # Populates internal fields based on fields passed as parameters
  def populate_from_params(need, from_user, is_from_mentor)
    @need = need
    @from_user = from_user
    @is_from_mentor = is_from_mentor
  end

  # Populates internal fields based on an incoming mangled string
  def populate_from_string(mangled_str)
    text = mangled_str.split('-')
    @need = Need.find(text[1])
    @from_user = User.find(text[3])
    @is_from_mentor = (text[4] == "mentor" ? true : false)
  end

  # Returns the recipient of this email.  This isn't stored in the mangled address -- it's implicit
  def to_user
    return (@is_from_mentor ? @need.user : @need.mentor)
  end

  # Transforms internal fields into a mangled string
  def to_s
    "#{@from_user.name} via Karma <need-#{@need.id}-from-#{@from_user.id}-" + (@is_from_mentor ? "mentor-" : "user-") + "@karma.mailgun.org>"
  end

=begin
  def encrypt_password
    if password.present?
      self.token = BCrypt::Engine.generate_salt
      self.secret = BCrypt::Engine.hash_secret(password, token)
    end
  end
=end

end