class Admin::ApplicationController < ActionController::Base
  include Admin::Authentication
  layout "admin"
  private

  def after_authentication_url
    admin_users_path # 管理者用ダッシュボードのパス
  end

  def after_logout_url
    new_admin_session_path
  end
end
