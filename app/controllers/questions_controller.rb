class QuestionsController < ActionController::Base
  inherit_resources
  layout 'application'
  before_action :authenticate_user!

  def create
    build_resource
    build_category_mappings
    if resource.save
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def update
    build_category_mappings
    update!
  end


  private

  def build_category_mappings
    category_mappings = params[:category_mappings] || {}

    Question::CATEGORIES.keys.each do |cm|
      if category_mappings[cm] == "1"
        CategoryMapping.map(resource, Question::CATEGORIES[cm])
      else
        CategoryMapping.unmap(resource, Question::CATEGORIES[cm])
      end
    end
  end

  def permitted_params
    params.permit(question: [:typus, :title, :introduction, :content, :answer, :tag_list])
  end

  def collection
    @questions ||= Question.order(:id)
  end

end
