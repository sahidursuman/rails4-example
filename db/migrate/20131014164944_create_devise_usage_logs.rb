class CreateDeviseUsageLogs < ActiveRecord::Migration
  def change
    create_table :devise_usage_logs do |t|
      t.integer    :user_id,      null: false
      t.string     :user_ip
      t.string     :role

      t.datetime   :new_account_at
      t.datetime   :confirmed_at
      t.datetime   :login_at
      t.datetime   :new_password_at
      t.datetime   :unlocked_at
      t.datetime   :account_edit_at
      t.datetime   :deleted_at

      t.timestamps
    end
    add_index :devise_usage_logs, :user_id
  end
end
