class NeedObserver < ActiveRecord::Observer
  def after_save(need)
#    if (need.mentor_id_changed? && !need.mentor_id.blank?)
#      NotifierMailer.need_assigned(need).deliver
#    end
  end
end