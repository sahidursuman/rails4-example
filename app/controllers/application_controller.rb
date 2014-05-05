class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :reset_session # TODO: is this what I want?

  before_action :configure_permitted_parameters, if: :devise_controller?

  check_authorization unless: :devise_controller?

  add_flash_types :error, :success # available flash types: notice, alert, error, success

  def check_access_level(role)
    redirect_to root_path unless current_user && current_user.role?(role)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end

  ## devise

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do
      |user| user.permit(:username, :email, :role, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:sign_in) do
      |user| user.permit(:username, :password, :remember_me)
    end
    devise_parameter_sanitizer.for(:account_update) do
      |user| user.permit(:username, :email, :role, :current_password, :password, :password_confirmation)
    end
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    DeviseUsageLog.log(resource_or_scope, DeviseAction::Login)
    stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
  end

end
