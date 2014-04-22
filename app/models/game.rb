class Game < ActiveRecord::Base

  # associations
  #
  #

  has_many :results
  has_many :questions

  # instance methods
  #
  #

  def question(round, number)
    Question.where(round: round, game_id: self.id).first
  end

end

