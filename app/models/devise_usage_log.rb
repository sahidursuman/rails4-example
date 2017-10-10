# == Schema Information
#
# Table name: devise_usage_logs
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  user_ip    :string(255)
#  role       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  username   :string(255)
#  action     :string(255)
#

class DeviseUsageLog < ActiveRecord::Base

  classy_enum_attr :action, enum: 'DeviseAction', allow_nil: true

  def self.fetch_usage_report_entries(num_days = 10)
    DeviseUsageLog.where('created_at > ?', Time.zone.today - num_days.days)
                  .order('devise_usage_logs.created_at desc')
                  .order('user_id')
  end

  def self.log(resource, new_action)
    return unless User.valid_user?(resource)

    level = begin
              Rails.configuration.devise_usage_log_level
            rescue StandardError
              nil
            end
    return unless level == :all || (level == :login && new_action == DeviseAction::Login)

    resource.log_devise_action(new_action)
  end
end
