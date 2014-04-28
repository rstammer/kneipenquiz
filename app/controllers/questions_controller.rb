class QuestionsController < ActionController::Base
  inherit_resources
  layout 'application'
  before_action :authenticate_user!

  def create
    create!
    build_category_mappings
  end

  def update
    update!
    build_category_mappings
  end


  private

  def build_category_mappings
    category_mappings = params[:category_mappings] || {}

    Question::CATEGORIES.keys.each do |cm|
      if category_mappings[cm] == "1"
        CategoryMapping.map(resource, Question::CATEGORIES[cm][:title])
      else
        CategoryMapping.unmap(resource, Question::CATEGORIES[cm][:title])
      end
    end
  end

  def permitted_params
    params.permit(question: [
      :typus, :title, :introduction,
      :content, :answer, :tag_list,
      :image, :external_image_url
    ])
  end

  def collection
    @questions ||= begin
                     scope = Question.order(:id)
                     scope = scope.where(typus: params[:typus]) if params[:typus].present?
                     scope = scope.tagged_with(params[:q])      if params[:q].present?
                     scope
                   end
  end

end
