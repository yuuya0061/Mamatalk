class ApplicationController < ActionController::Base
  include Authentication

   before_action :authenticated?
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

   private

  def after_authentication_url
    posts_path
  end

  def after_logout_url
    root_path
  end
end
