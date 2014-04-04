class CategoryMappingsController < ActionController::Base
  inherit_resources
  layout 'application'

  def create
    build_resource
    if resource.save!
      redirect_to questions_path, notice: 'Ok, Zuordnung erfolgt'
    else
      redirect_to questions_path, alert: 'Da ist was schiefgelaufen!'
    end
  end

  private

  def permitted_params
    params.permit(category_mapping: [:category_id, :question_id])
  end

end
