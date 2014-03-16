class Result < ActiveRecord::Base

  belongs_to :team
  belongs_to :game

  validates :round_one, :round_two, :round_three,
            :round_four, :total_score, :team_id,
            :game_id,
            presence: true

end
