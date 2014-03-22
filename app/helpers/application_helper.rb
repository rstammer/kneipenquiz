module ApplicationHelper
  def options_for_questions
    Question.all.map(&:title)
  end
end
