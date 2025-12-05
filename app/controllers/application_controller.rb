class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  # Only allows access to json 
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  # Requires authentication for controller actions
  helper_method :current_user

  def current_user
    User.find_by(id: cookies.signed[:user_id])
  end

  def authenticate_user
    unless current_user
      render json: { errors: "Unauthorized" }, status: :unauthorized
    end
  end

  def authenticate_admin
    unless current_user && current_user.admin
      render json: { errors: "Unauthorized - must be an admin" }, status: :unauthorized
    end
  end
end
