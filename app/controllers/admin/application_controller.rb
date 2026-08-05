class Admin::ApplicationController < ActionController::Base
  include Admin::Authentication
  layout "admin"
  private

  def after_authentication_url
    admin_users_path 
  end

  def after_logout_url
    new_admin_session_path
  end
end
