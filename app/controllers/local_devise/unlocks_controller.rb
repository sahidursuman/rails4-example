class LocalDevise::UnlocksController < Devise::UnlocksController

  private
  
  def after_unlock_path_for(resource)
    resource.log_devise_action('unlocked_at') if resource
    new_session_path(resource)
  end

end