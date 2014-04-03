module ApplicationHelper

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
