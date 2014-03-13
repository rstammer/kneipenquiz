class TeamsController < ActionController::Base
  inherit_resources
  layout 'application'

  def create
    build_resource
    resource.save
    redirect_to teams_path
  end

  def permitted_params
    params.permit(team: [:title])
  end
end
