class AddUsernameToDeviseUsageLog < ActiveRecord::Migration
  def change
    add_column :devise_usage_logs, :username, :string
  end
end
