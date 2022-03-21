class ApplicationController < ActionController::Base
  # include SessionsHelper
  before_action :configure_permitted_parameters , if: :devise_controller?
  # before_action :authenticate_user!
  
  private

  # def require_user_logged_in
  #   unless logged_in?
  #     redirect_to login_url
  #   end
  # end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
