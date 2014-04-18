class GamesController < ActionController::Base
  inherit_resources
  layout 'application'
  before_action :authenticate_user!

  def create
    build_resource
    (1..4).each do |round_number|
      (1..8).each do |n|
        question_number = n*round_number
        question = Question.find(params["question#{question_number}"])
        question.round = round_number.to_s
        question.game_id = resource.id
        question.save
      end
    end

    resource.save
    redirect_to games_path, notice: 'Alright, Dude. Spiel ist im Kasten!'
  end

  def load_game
  end

  def start
  end

  def round_one
    @questions = resource.questions.where(round: "1")
  end

  def round_two
  end

  def intermezzo
  end

  def round_three
  end

  def round_four
  end

  def index
  end

  private

  def resource
    @game ||= Game.find(params[:id])
  end

  def permitted_params
    params.permit(game: [
      :title, :expected_date,
      :question1, :question2, :question3,
      :question3, :question4, :question5,
      :question6, :question7, :question8,
      :question9, :question10, :question11,
      :question12, :question13, :question14,
      :question15, :question16, :question17,
      :question18, :question19, :question20,
      :question21, :question22, :question23,
      :question24
    ])
  end

end
