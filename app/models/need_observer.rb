class NeedObserver < ActiveRecord::Observer
  def after_save(need)
    if (need.helper_id_changed? && !need.helper_id.blank?)
#      NotifierMailer.need_assigned(need).deliver
    end
  end
end