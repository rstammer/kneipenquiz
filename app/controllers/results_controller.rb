class ResultsController < ActionController::Base
  inherit_resources
  layout 'application'
  before_action :authenticate_user!

  def create
    build_resource
    resource.save
    redirect_to teams_path
  end

  private

  def permitted_params
    params.permit(result: [:round_one, :round_two, :round_three, :round_four, :total_score, :team_id, :game_id])
  end
end
