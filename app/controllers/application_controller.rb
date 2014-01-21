class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :reset_session # TODO: is this what I want?
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

  check_authorization :unless => :devise_controller?
  
  add_flash_types :error, :success # available flash types: notice, alert, error, success

  def check_access_level(role)
     redirect_to root_path unless (current_user && current_user.role?(role))
  end
 
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  ## devise
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :username, :email, :role, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit( :username, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :username, :email, :role, :current_password, :password, :password_confirmation) }
  end
      
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
 
  def after_sign_in_path_for(resource_or_scope) 
    resource_or_scope.log_devise_action('login') if resource_or_scope && resource_or_scope.kind_of?(User)
    stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
  end

end
