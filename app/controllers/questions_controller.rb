class QuestionsController < ActionController::Base
  inherit_resources
  layout 'application'
  before_action :authenticate_user!

  def create
    create!
    add_autotags
    build_category_mappings
  end

  def update
    update! do |success, failure|
      success.html do
        add_autotags
        build_category_mappings
        redirect_to questions_path, notice: 'Frage wurde erfolgreich editiert.'
      end
      failure.html do
        render 'edit', alert: 'Konnte Frage nicht speichern!'
      end
    end
  end


  private

  def add_autotags
    if resource.game.blank?
      resource.tag_list.add('unbenutzt')
    else
      resource.tag_list.remove('unbenutzt')
    end
    resource.save
  end

  def build_category_mappings
    category_mappings = params[:category_mappings].presence || {}

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
                     scope = Question.order(:created_at)
                     scope = scope.where(game_id: params[:game])               if params[:game].present?
                     scope = scope.where(typus: params[:typus])                if params[:typus].present?
                     scope = scope.tagged_with(params[:q])                     if params[:q].present?
                     scope = scope.select { |q| q.has_category? params[:cat] } if params[:cat].present?
                     scope
                   end
  end

end
