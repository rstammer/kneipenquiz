class Result < ActiveRecord::Base

  # associations
  #
  #

  belongs_to :team
  belongs_to :game

  # validations
  #
  #

  validates :round_one,
            :round_two,
            :round_three,
            :round_four,
            :total_score,
            :team_id,
            :game_id,
            presence: true

  # callbacks
  #
  #

  after_create :update_team_score

  # instance methods
  #
  #

  def update_team_score
    new_value = team.total_score.to_f + self.total_score.to_f
    team.update_column(:total_score, new_value)
  end

end
