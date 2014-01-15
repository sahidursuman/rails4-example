class PopulateUsernameInDeviseUsageLog < ActiveRecord::Migration
  # NOTE: handle with SQL from a rake task or elsewhere if table is large
  def self.up
    if DeviseUsageLog.column_names.include? 'username'
      DeviseUsageLog.find_each do |entry|
        user = User.find_by_id(entry.user_id)
        entry.update_column(:username, user.username) if user
      end
    end
  end
end
