namespace :devise_usage do

  desc %{quick list of last 10 days of devise usage}
  task :report, [:exclude_ip] => :environment do |t, args|
    exclude_ip = args[:exclude_ip] || ''
    printf("\nDevise Usage Log - %s (previous 10 days)\n",
      Time.now.strftime("%m/%d/%Y"))
    printf("=================================================\n")
   
    (Date.today).downto(Date.today - 9.days) do |date|
      entries = DeviseUsageLog.where("CAST(updated_at as DATE) = ?", date).order('user_id,updated_at')
      if entries.count > 0
        printf "\n%s:\n-----------\n", date
        entries.each do |entry|
          unless exclude_ip.present? && entry.user_ip == exclude_ip
            printf "USER: %-12s IP: %-15s ROLE: %-8s ACTION: %s\n", 
              (entry.user) ? entry.user.username : "(unknown)", # keep orphaned log entries to see deleted user
              entry.user_ip, 
              entry.role,
              list_actions(entry)
          end
        end
      end
    end
	end

  private
  
  def list_actions entry
    line = ''
    line += 'new account ' if entry.new_account_at
    line += 'confirmed ' if entry.confirmed_at
    line += 'login ' if entry.login_at
    line += 'new password ' if entry.new_password_at
    line += 'unlocked ' if entry.unlocked_at
    line += 'edit account ' if entry.account_edit_at
    line += 'delete account ' if entry.deleted_at
    line   
  end
end
