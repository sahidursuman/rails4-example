class LocalDevise::RegistrationsController < Devise::RegistrationsController

  def destroy
    resource.log_devise_action('deleted_at') if resource
    super
  end

  private
  
  def after_inactive_sign_up_path_for(resource)
    resource.log_devise_action('new_account_at') if resource
    root_path
  end

  def after_sign_up_path_for(resource)
    resource.log_devise_action('new_account_at') if resource
    stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
  end

  def after_update_path_for(resource)
    resource.log_devise_action('account_edit_at') if resource
    root_url
  end

end