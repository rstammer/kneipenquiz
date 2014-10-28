class GamesController < ActionController::Base
  inherit_resources
  layout 'application'
  before_action :authenticate_user!

  def create
    create!
    build_questions(params[:questions])
  end

  def update
    update!
    build_questions(params[:questions])
  end

  def menu
  end


  private

  def collection
    @games ||= Game.all
  end

  def resource
    @game ||= Game.find(params[:id])
  end

  def permitted_params
    params.permit(game: [
      :title, :expected_date,
      questions: [ "1", "2", "3", "4", "5", "6", "7", "8"]
    ])
  end

  def build_questions(question_params)
    (1..4).each do |round_number|
      question_params[round_number.to_s].keys.each do |question_number|

        q = Question.find_by id: question_params[round_number.to_s][question_number].to_i
        if q.present?
          q.round    = round_number
          q.position = question_number
          q.game_id  = resource.id
          q.save
        end
      end
    end
  end

end
