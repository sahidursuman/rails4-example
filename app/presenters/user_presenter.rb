class UserPresenter < BasePresenter
  presents :user

  delegate :id, to: :user
  delegate :role, to: :user

  def last_login
    if user.current_sign_in_at
      str = user.current_sign_in_at
    elsif user.last_sign_in_at
      str = user.last_sign_in_at
    elsif user.confirmation_sent_at
      str = user.confirmation_sent_at
    end
    str ? (l str, format: '%Y-%m-%d') : ''
  end

  def last_ip
    if user.current_sign_in_ip
      str = user.current_sign_in_ip
    elsif user.last_sign_in_ip
      str = user.last_sign_in_ip
    end
    str ? str : ''
  end

  def user_name
    html = []
    if user.role?('admin')
      html << content_tag(:span, '', class: 'glyphicon glyphicon-user')
      html << spaces(1)
    end
    html << user.username
    html << spaces(1)
    html << content_tag(:span, t('label.unconfirmed').downcase, class: 'help-block devise') unless user.confirmed?
    safe_join(html)
  end

  def email
    html = []
    html << user.email
    if user.pending_reconfirmation?
      unconfirmed_email = user.unconfirmed_email + ' ' + t('label.pending').downcase
      html << spaces(1)
      html << content_tag(:span, unconfirmed_email, class: 'help-block devise')
    end
    safe_join(html)
  end

  def sign_in_count
    (user.sign_in_count > 0) ? user.sign_in_count : ''
  end

  def list_roles_for_select
    list = []
    user.roles.each do |role, _idx|
      next if role == 'admin' && !user.role?('admin')
      list << [role.humanize, role]
    end
    list
  end

end
