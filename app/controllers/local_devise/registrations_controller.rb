class LocalDevise::RegistrationsController < Devise::RegistrationsController

  def destroy
    resource.log_devise_action('delete') if resource && resource.kind_of?(User)
    super
  end

  private
  
  def after_inactive_sign_up_path_for(resource)
    resource.log_devise_action('new') if resource && resource.kind_of?(User)
    root_path
  end

  def after_sign_up_path_for(resource)
    resource.log_devise_action('new') if resource && resource.kind_of?(User)
    stored_location_for(resource) || signed_in_root_path(resource)
  end

  def after_update_path_for(resource)
    resource.log_devise_action('edit') if resource && resource.kind_of?(User)
    root_url
  end

end