class UserObserver < ActiveRecord::Observer
  def after_create(user)
    NotifierMailer.sign_up(user).deliver if !user.email.blank?
    NotifierMailer.admin_new_user_alert(user).deliver
  end

  def after_update(user)
    # TODO: This is a hack. It will send the signup email whenever the email is changed.
    NotifierMailer.sign_up(user).deliver if user.email_changed?
  end
end