class User < ActiveRecord::Base

  has_many :devise_usage_log

  devise :database_authenticatable, :registerable, :confirmable, :lockable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable #, :omniauthable

  validates :username, :uniqueness => true, :length => { :within => 4..12 }
  
  ROLES = { 'guest' => 1, 'user' => 2, 'manager' => 3, 'admin' => 4 }

  def roles
    ROLES
  end

  def role?(base_role)
    ROLES[role.to_s] >= ROLES[base_role.to_s.downcase]
  end

  def is_role?(test_role)
    role == test_role
  end

  def user_exists_but_force_password_reset?
    (id && confirmed_at.present? && reset_password_token.present? && last_sign_in_at.blank? && last_sign_in_ip.blank?) ? true : false
  end

  def log_devise_action(field)
    log_entry = DeviseUsageLog.new ({user_id: id, role: role, user_ip: current_sign_in_ip})
    if log_entry.save
      log_entry.update_attribute(:"#{field}", Time.now) if field
    end
  end
    
end
