class AddActionToDeviseUsageLogs < ActiveRecord::Migration
  def change
    add_column :devise_usage_logs, :action, :string
  end
end
