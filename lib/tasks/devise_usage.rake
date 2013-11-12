namespace :devise_usage do

  desc %{quick list of last 10 days of devise usage}
  task :report => :environment do |t|
    printf("\nDevise Usage Log - %s (previous 10 days)\n",
      Time.now.strftime("%m/%d/%Y"))
    printf("=================================================\n")
    
    (Date.today).downto(Date.today - 9.days) do |date|
      entries = DeviseUsageLog.where("CAST(updated_at as DATE) = ?", date).order('user_id,updated_at')
      if entries.count > 0
        printf "%s:\n", date
        entries.each do |entry|
          printf "\tUSER: %-15s %s", 
          (entry.user) ? entry.user.username : "(unknown)", # keep orphaned log entries but check for deleted user
          display_line(entry)
        end
      end
    end
	end

  private
  
  def display_line entry
    action_format = "%-15s WHEN: %s\n"
    line = sprintf("IP: %-15s ROLE: %-6s ACTION: ", entry.user_ip, entry.role)
    line += sprintf(action_format, 'new account', entry.new_account_at.strftime('%m/%d/%Y')) if entry.new_account_at
    line += sprintf(action_format, 'confirmed', entry.confirmed_at.strftime('%m/%d/%Y')) if entry.confirmed_at
    line += sprintf(action_format, 'login', entry.login_at.strftime('%m/%d/%Y')) if entry.login_at
    line += sprintf(action_format, 'new password', entry.new_password_at.strftime('%m/%d/%Y')) if entry.new_password_at
    line += sprintf(action_format, 'unlocked', entry.unlocked_at.strftime('%m/%d/%Y')) if entry.unlocked_at
    line += sprintf(action_format, 'edit account', entry.account_edit_at.strftime('%m/%d/%Y')) if entry.account_edit_at
    line += sprintf(action_format, 'delete account', entry.deleted_at.strftime('%m/%d/%Y')) if entry.deleted_at
    line    
  end
end
