class ApplicationController < ActionController::Base
  before_action :permit_params, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_locale

  def after_sign_in_path_for(resource)
    current_user.admin? ? admin_tests_path : (stored_location_for(resource) || root_path)
  end

  def default_url_options
    { lang: I18n.locale }
  end

  private

  def permit_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
