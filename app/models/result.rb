class Result < ActiveRecord::Base

  belongs_to :team
  belongs_to :game

  validates :round_one,
            :round_two,
            :round_three,
            :round_four,
            :total_score,
            :team_id,
            :game_id,
            presence: true

  after_create :update_team_score

  def update_team_score
    new_value = team.total_score.to_i + self.total_score.to_i
    team.update_column(:total_score, new_value)
  end

end
