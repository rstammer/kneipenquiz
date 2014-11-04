class PostsController < ActionController::Base

  inherit_resources
  layout 'application'

  private

  def permitted_params
    params.permit(post: [:title, :content])
  end

end
