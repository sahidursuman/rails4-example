class DeviseUsageLog < ActiveRecord::Base
  belongs_to :user
  
  def self.fetch_usage_report_entries( num_days=10 )
    today = Time.now.strftime('%Y-%m-%d')
    past_date = (Date.today - (num_days-1).days).strftime('%Y-%m-%d')
    between_when = sprintf "CAST(devise_usage_logs.updated_at as DATE) between '%s' and '%s'", past_date, today

    # SELECT devise_usage_logs.* , users.username AS user_name
    # FROM devise_usage_logs
    # LEFT OUTER JOIN users ON users.id = devise_usage_logs.user_id
    # WHERE ( #{between_when} )
    # ORDER BY devise_usage_logs.updated_at desc, user_id  
    DeviseUsageLog.select('devise_usage_logs.*, users.username as user_name').joins("LEFT OUTER JOIN users ON users.id = devise_usage_logs.user_id").where(between_when).order('devise_usage_logs.updated_at desc').order('user_id')
  end

end
