class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    unless current_user
      save_url
      redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please.'
    end

    cookies[:_test_guru_email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def save_url
    cookies[:_test_guru_saved_url] = request.url
  end

  def saved_url
    cookies[:_test_guru_saved_url]
  end

  def clear_saved_url
    cookies[:_test_guru_saved_url] = nil
  end
end
