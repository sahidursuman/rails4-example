module DeviseHelper

  # override to make formatting more friendly
  def devise_error_messages!
    format_user_error_messages(resource)
  end

  def format_user_error_messages(resource)

    return "" if resource.errors.empty?
    
    msgs = resource.errors.full_messages
    alert_class = 'alert-danger'

    # empty out error messages so they don't linger
    resource.errors.clear  

    content_tag :div, :class => "alert fade in #{alert_class}" do
      html = content_tag :ul do
        msgs.collect {|msg| concat(content_tag(:li, msg.html_safe))}
      end
      content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") + html
    end 
  end

  def format_devise_usage_action_for entry
    action_format = "%s (%s) "
    line = ""
    line += sprintf(action_format, 'new account', entry.new_account_at.strftime('%H:%M')) if entry.new_account_at
    line += sprintf(action_format, 'confirmed', entry.confirmed_at.strftime('%H:%M')) if entry.confirmed_at
    line += sprintf(action_format, 'login', entry.login_at.strftime('%H:%M')) if entry.login_at
    line += sprintf(action_format, 'new password', entry.new_password_at.strftime('%H:%M')) if entry.new_password_at
    line += sprintf(action_format, 'unlocked', entry.unlocked_at.strftime('%H:%M')) if entry.unlocked_at
    line += sprintf(action_format, 'edit account', entry.account_edit_at.strftime('%H:%M')) if entry.account_edit_at
    line += sprintf(action_format, 'delete account', entry.deleted_at.strftime('%H:%M')) if entry.deleted_at
    line    
  end

end
