class DeviseUsageLog < ActiveRecord::Base

  classy_enum_attr :action, enum: 'DeviseAction', allow_nil: true

  def self.fetch_usage_report_entries(num_days = 10)
    # rubocop:disable MultilineOperationIndentation
    DeviseUsageLog.where('created_at > ?', DateTime.now - num_days.days)
                  .order('devise_usage_logs.created_at desc')
                  .order('user_id')
    # rubocop:enable all
  end

  def self.log(resource, new_action)
    return unless User.valid_user?(resource) && (Rails.configuration.respond_to? :devise_usage_log_level)
    level = Rails.configuration.devise_usage_log_level
    if level == :all || (level == :login && new_action == DeviseAction::Login)
      resource.log_devise_action(new_action)
    end
  end
end
