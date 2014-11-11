class ResultsController < ActionController::Base
  inherit_resources
  layout 'application'
  before_action :authenticate_user!
  helper_method :teams

  def create
    build_resource
    resource.save
    redirect_to teams_path
  end

  private

  def teams
    @teams ||= Team.all
  end

  def permitted_params
    params.permit(result: [:round_one, :round_two, :round_three, :round_four, :total_score, :team_id, :game_id])
  end
end
