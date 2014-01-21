class LocalDevise::PasswordsController < Devise::PasswordsController

  private
  
  def after_resetting_password_path_for(resource)
    resource.log_devise_action('password') if resource && resource.kind_of?(User)
    stored_location_for(resource) || signed_in_root_path(resource)
  end

end
