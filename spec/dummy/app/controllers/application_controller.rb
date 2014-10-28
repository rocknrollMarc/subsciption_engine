class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def force_authentication!(account, user)
    env["warden"].set_user(user, :scope => :user)
    env["warden"].set_user(account, :scope => :account)
  end
end
