class LocalDevise::UnlocksController < Devise::UnlocksController

  private
  
  def after_unlock_path_for(resource)
    resource.log_devise_action('unlocked') if resource && resource.kind_of?(User)
    new_session_path(resource)
  end

end