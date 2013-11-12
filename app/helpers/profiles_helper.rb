module ProfilesHelper

  def list_roles_for_select(user)
    list = []
    user.roles.each do |role, i|
      next if role == 'admin' && !current_user.role?('admin')
      list << [role.humanize,role]
    end
    list
  end

end
