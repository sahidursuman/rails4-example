class DeviseUsageLog < ActiveRecord::Base
  belongs_to :user
  
  #TODO: is an enum really necessary?
  classy_enum_attr :action, enum: 'DeviseAction', allow_nil: true
  
  def self.fetch_usage_report_entries( num_days=10 )
    DeviseUsageLog.where("created_at > ?", DateTime.now - num_days.days).order('devise_usage_logs.created_at desc').order('user_id')
  end

end
