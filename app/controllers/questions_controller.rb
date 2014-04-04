class QuestionsController < ActionController::Base
  inherit_resources
  layout 'application'
  before_action :authenticate_user!

  def create
    build_resource
    if resource.save
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def permitted_params
    params.permit(question: [:typus, :title, :introduction, :content, :answer, :tag_list])
  end
end
