class QuestionsController < ActionController::Base
  inherit_resources
  layout 'application'

  def create
    build_resource
    resource.save
    redirect_to questions_path
  end

  def permitted_params
    params.permit(question: [:title, :content, :answer])
  end
end
