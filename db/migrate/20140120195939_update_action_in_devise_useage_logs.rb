class UpdateActionInDeviseUseageLogs < ActiveRecord::Migration
  def self.up
    say_with_time('Updating log entry action') do
      DeviseUsageLog.find_each do |entry|
        case
        when entry.new_account_at.present?
          entry.action = 'new'
        when entry.confirmed_at.present?
          entry.action = 'confirmed'
        when entry.login_at.present?
          entry.action = 'login'
        when entry.new_password_at.present?
          entry.action = 'password'
        when entry.unlocked_at.present?
          entry.action = 'unlocked'
        when entry.account_edit_at.present?
          entry.action = 'edit'
        when entry.deleted_at.present?
          entry.action = 'delete'
        end
        entry.save!
      end
    end
  end

  def self.down
  end

end
