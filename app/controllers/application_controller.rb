class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  helper_method :current_user

  def current_user
    User.find_by(id: cookies.signed[:user_id])
  end

  def authenticate_user
    puts "-------------"
    pp current_user
    puts "-------------"
    unless current_user
      render json: {}, status: :unauthorized
    end
  end

  def authenticate_admin
    unless current_user && current_user.admin
      render json: {error: "Unauthorized - must be a big-pimpin"}
    end
  end

  def authorize_post_owner
    post = Post.find(params[:id])
    unless current_user.admin || post.user_id == current_user.id
      render json: {error: "Unauthorized - not your cheese pimpin"}
    end
  end
end
