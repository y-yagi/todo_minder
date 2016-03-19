class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_logged_in
  force_ssl if: :ssl_configured?

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def check_logged_in
    redirect_to login_path unless logged_in?
  end

  def ssl_configured?
    Rails.env.production?
  end
end
