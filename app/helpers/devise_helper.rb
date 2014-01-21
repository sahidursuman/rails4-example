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

end
