class Game < ActiveRecord::Base

  has_many :results
  has_many :questions


  def question(round, number)
    Question.where(round: round, game_id: self.id).first
  end
end

