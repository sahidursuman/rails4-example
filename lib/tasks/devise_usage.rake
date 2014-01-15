namespace :devise_usage do

  desc %{quick list of last 10 days of devise usage}
  task :report, [:exclude_ip] => :environment do |t, args|
    exclude_ip = args[:exclude_ip] || ''
    printf("\nDevise Usage Log - %s (previous 10 days)\n",
      Time.now.strftime("%m/%d/%Y"))
    printf("=================================================\n")

    today = Time.now.strftime('%Y-%m-%d')
    past_date = (Date.today - 9.days).strftime('%Y-%m-%d')
    between_when = sprintf "CAST(devise_usage_logs.updated_at as DATE) between '%s' and '%s'", past_date, today
    entries = DeviseUsageLog.where(between_when).order('devise_usage_logs.updated_at desc').order('user_id')

    previous_date_string = ''        
    entries.each do |entry|
      current_date_string = entry.updated_at.strftime('%m/%d/%Y')
      printf "\n%s:\n-----------\n", current_date_string if current_date_string != previous_date_string
      unless exclude_ip.present? && entry.user_ip == exclude_ip
        printf "USER: %-12s IP: %-15s ROLE: %-8s ACTION: %s\n", 
          (entry.username.present?) ? entry.username : "(unknown)",
          entry.user_ip, 
          entry.role,
          list_actions(entry)
      end
      previous_date_string = current_date_string
    end
	end

  private
  
  def list_actions entry
    action_format = "%s (%s) "
    line = ""
    line += sprintf(action_format, 'new account', entry.new_account_at.strftime('%H:%M')) if entry.new_account_at
    line += sprintf(action_format, 'confirmed', entry.confirmed_at.strftime('%H:%M')) if entry.confirmed_at
    line += sprintf(action_format, 'login', entry.login_at.strftime('%H:%M')) if entry.login_at
    line += sprintf(action_format, 'new password', entry.new_password_at.strftime('%H:%M')) if entry.new_password_at
    line += sprintf(action_format, 'unlocked', entry.unlocked_at.strftime('%H:%M')) if entry.unlocked_at
    line += sprintf(action_format, 'edit account', entry.account_edit_at.strftime('%H:%M')) if entry.account_edit_at
    line += sprintf(action_format, 'delete account', entry.deleted_at.strftime('%H:%M')) if entry.deleted_at
    line    
  end
end
