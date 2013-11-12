class LocalDevise::PasswordsController < Devise::PasswordsController

  private
  
  def after_resetting_password_path_for(resource)
    resource.log_devise_action('new_password_at') if resource
    stored_location_for(resource) || signed_in_root_path(resource)
  end

end