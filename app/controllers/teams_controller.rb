class TeamsController < ActionController::Base
  inherit_resources
  layout 'application'
  before_action :authenticate_user!

  def create
    build_resource
    resource.save
    redirect_to teams_path
  end

  private

  def collection
    @teams ||= Team.all.order('total_score DESC')
  end

  def permitted_params
    params.permit(team: [:title])
  end
end
