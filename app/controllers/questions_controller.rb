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


  private

  def permitted_params
    params.permit(question: [:typus, :title, :introduction, :content, :answer, :tag_list])
  end

  def collection
    @questions ||= Question.order(:id)
  end

end
