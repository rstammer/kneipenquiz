module ApplicationHelper

  def category_checked?(cat)
    check = resource.category_mappings.collect { |cm| cm.category }.map(&:title).include? Question::CATEGORIES[cat][:title]
    { :checked => 'checked' } if check.present?
  end

  def options_for_typus
    [['alle Typen', nil]] + Question::TYPES.map { |type| [type, type] }
  end

  def options_for_questions
    [['auswählen', nil]] + Question.all.map { |q| [q.title, q.id] }
  end

  def options_for_cats
    [['alle Kategorien', nil]] + Question::CATEGORIES.keys.map { |cat| [cat, cat] }
  end

  def options_for_games
    [['alle Spiele', nil]] + Game.all.map { |g| [shorten(g.title), g.id] }
  end

  def selected(game, round, position)
    q = Question.for(game, round, position)
    q.present? ? [q.id, q.title] : nil
  end

  def shorten(text)
    text.size > 18 ? text.first(18) + '...' : text
  end

end
