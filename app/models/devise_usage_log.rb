class DeviseUsageLog < ActiveRecord::Base

  classy_enum_attr :action, enum: 'DeviseAction', allow_nil: true

  def self.fetch_usage_report_entries(num_days = 10)
    DeviseUsageLog.where('created_at > ?', DateTime.now - num_days.days)
                  .order('devise_usage_logs.created_at desc').order('user_id')
  end

  # rubocop:disable CyclomaticComplexity
  # TODO: get complexity down to 6 from 8, resource checks should happen in calling method
  def self.log(resource, new_action)
    if resource && resource.kind_of?(User) && (Rails.configuration.respond_to? :devise_usage_log_level)
      level = Rails.configuration.devise_usage_log_level || ''
      if level == :all || (level == :login && new_action == DeviseAction::Login)
        resource.log_devise_action(new_action)
      end
    end
  end
  # rubocop:enable CyclomaticComplexity

end
