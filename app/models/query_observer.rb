class QueryObserver < ActiveRecord::Observer
  def after_create(query)
    NotifierMailer.admin_new_query_alert(query).deliver
  end

  def after_save(query)
    if (query.mentor_id_changed? && !query.mentor_id.blank?)
      NotifierMailer.query_assigned(query).deliver
    end
  end
end