class CategoryMappingsController < ActionController::Base
  inherit_resources
  layout 'application'

  def create
    build_resource
    resource.save!
    redirect_to questions_path
  end

  private

  def permitted_params
    params.permit(category_mapping: [:category_id, :question_id])
  end
end
