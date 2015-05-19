module FlashHelper

  def flash_messages
    bootstrap_flash_type = {notice: 'info', alert: 'warning', error: 'danger', success: 'success'}
    messages = []
    flash.each do |key, msg|
      next if msg.blank?
      next unless msg.is_a? String
      bootstrap_class = "alert fade in alert-#{bootstrap_flash_type[key.to_sym]}"
      messages << content_tag(:div, content_tag(:button, raw('&times;'),
                                                class: 'close',
                                                data: {dismiss: 'alert'}) + msg.html_safe, class: bootstrap_class)
    end
    flash.clear # empty so doesn't linger
    messages.join("\n").html_safe
  end

end
