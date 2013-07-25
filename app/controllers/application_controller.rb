class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def after_sign_out_path_for(scope)
    new_user_session_path
  end

  def access_denied
    flash[:error] = 'Access Denied'
    redirect_to root_path
  end
end
