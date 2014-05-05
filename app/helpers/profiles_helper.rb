module ProfilesHelper

  def list_roles_for_select(user)
    list = []
    user.roles.each do |role, _idx|
      next if role == 'admin' && !current_user.role?('admin')
      list << [role.humanize, role]
    end
    list
  end

end
