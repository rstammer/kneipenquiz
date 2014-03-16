class TeamsController < ActionController::Base
  inherit_resources
  layout 'application'

  def new
    collection
    build_resource
  end

  def create
    build_resource
    resource.save
    redirect_to teams_path
  end

  private

  def collection
    @teams ||= Team.all
  end

  def permitted_params
    params.permit(team: [:title])
  end
end
