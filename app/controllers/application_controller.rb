class ApplicationController < ActionController::Base
  before_action :permit_params, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    current_user.admin? ? admin_tests_path : (stored_location_for(resource) || root_path)
  end

  def permit_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end
end
