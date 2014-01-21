class DropColumnsFromDeviseUsageLogs < ActiveRecord::Migration
  def up
    remove_column :devise_usage_logs, :new_account_at
    remove_column :devise_usage_logs, :confirmed_at
    remove_column :devise_usage_logs, :login_at
    remove_column :devise_usage_logs, :new_password_at
    remove_column :devise_usage_logs, :unlocked_at
    remove_column :devise_usage_logs, :account_edit_at
    remove_column :devise_usage_logs, :deleted_at
  end

  def down
    add_column :devise_usage_logs, :new_account_at, :datetime
    add_column :devise_usage_logs, :confirmed_at, :datetime
    add_column :devise_usage_logs, :login_at, :datetime
    add_column :devise_usage_logs, :new_password_at, :datetime
    add_column :devise_usage_logs, :unlocked_at, :datetime
    add_column :devise_usage_logs, :account_edit_at, :datetime
    add_column :devise_usage_logs, :deleted_at, :datetime
  end
end
