class ResultsController < ActionController::Base
  inherit_resources
  layout 'application'
  before_action :authenticate_user!
  helper_method :teams

  def create
    scores.keys.each do |team_id|
      team = Team.find(team_id.to_i)
      team.results.create do |result|
        result.game_id     = params[:game_id]
        result.round_one   = scores[team_id][1].to_f
        result.round_two   = scores[team_id][2].to_f
        result.round_three = scores[team_id][3].to_f
        result.round_four  = scores[team_id][4].to_f

        result.total_score = scores[team_id].inject(0) { |m, i| m += i.last.to_f }
      end
    end

    redirect_to teams_path
  end

  private

  def teams
    @teams ||= Team.all
  end

  def scores
    @scores ||= params.fetch(:scores, {})
  end

  def permitted_params
    params.permit(result: [:round_one, :round_two, :round_three, :round_four, :total_score, :team_id, :game_id])
  end
end
