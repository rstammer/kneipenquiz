class PostsController < ActionController::Base

  inherit_resources
  layout 'application'

  def create
    create! do |success, failure|
      success.html { redirect_to collection_path, notice: 'eingetragen!' }
      failure.html { render 'new', alert: 'Oh, das hat nicht geklappt...' }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to collection_path, notice: 'ok, geändert!' }
      failure.html { render 'edit', alert: 'Oh, das hat nicht geklappt...' }
    end
  end


  private

  def permitted_params
    params.permit(post: [:title, :content])
  end

end
