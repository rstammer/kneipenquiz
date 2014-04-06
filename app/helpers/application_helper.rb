module ApplicationHelper

  def category_checked?(cat)
    check = resource.category_mappings.collect { |cm| cm.category }.map(&:title).include? Question::CATEGORIES[cat]
    { :checked => 'checked' } if check.present?
  end

  def options_for_typus
    Question::TYPES.map { |type| [type, type] }
  end

  def options_for_questions
    Question.all.map { |q| [q.title, q.id] }
  end

  def options_for_game
    Game.all.map { |g| [g.title, g.id]}
  end
end
