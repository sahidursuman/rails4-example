class DeviseUsageLog < ActiveRecord::Base
  belongs_to :user
  
  def self.fetch_usage_report_entries( num_days=10 )
    today = Time.now.strftime('%Y-%m-%d')
    past_date = (Date.today - (num_days-1).days).strftime('%Y-%m-%d')
    between_when = sprintf "CAST(devise_usage_logs.updated_at as DATE) between '%s' and '%s'", past_date, today
    DeviseUsageLog.where(between_when).order('devise_usage_logs.updated_at desc').order('user_id')
  end

end
