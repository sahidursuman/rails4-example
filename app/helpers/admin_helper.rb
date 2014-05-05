module AdminHelper

  def display_last_login(user)
    if user.current_sign_in_at
      str = user.current_sign_in_at
    elsif user.last_sign_in_at
      str = user.last_sign_in_at
    elsif user.confirmation_sent_at
      str = user.confirmation_sent_at
    end
    (str) ? (l str, format: '%Y-%m-%d') : ''
  end

  def display_last_ip(user)
    if user.current_sign_in_ip
      str = user.current_sign_in_ip
    elsif user.last_sign_in_ip
      str = user.last_sign_in_ip
    end
    (str) ? str : ''
  end

  def display_user_name(user)
    html = ''
    html += "<span class=\'glyphicon glyphicon-user\'></span> " if user.role?('admin')
    html += user.username
    html += " <span class=\'help-block devise\'>#{t('label.unconfirmed').downcase}</span>" unless user.confirmed?
    html
  end

  def display_email(user)
    html = user.email
    if user.pending_reconfirmation?
      html += " <span class='help-block devise'>'#{user.unconfirmed_email}' #{t('label.pending').downcase}</span>"
    end
    html
  end
end
