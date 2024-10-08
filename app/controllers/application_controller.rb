class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :email, :password, :password_confirmation ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :email, :password, :password_confirmation, :current_password ])
  end

  def after_sign_in_path_for(resource)
    posts_path # Redirects to the posts index page after login
  end

  def after_sign_up_path_for(resource)
    posts_path # Redirects to the posts index page after sign up
  end
end
