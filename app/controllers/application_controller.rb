class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource
  before_filter :banned?
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to "/"
  end
  
  rescue_from ActiveRecord::RecordNotFound do
    handle_404
  end
  
  def handle_404
    redirect_to root_path
  end
  
  def banned?
    if current_user.present? && current_user.banned?
      sign_out current_user 
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'This account has been suspended....' }
      end
    end
  end
  
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:password, :password_confirmation, :current_password) }
  end
  
  def layout_by_resource
    if devise_controller?
      "device_layout"
    else
      "application"
    end
  end
  
end
