Kneipenquiz::Application.routes.draw do
  root to: 'games#index'

  resources :games do
    get :load_game, on: :collection
    get :round_one, on: :member
    get :round_two, on: :member
    get :intermezzo, on: :member
    get :round_three, on: :member
    get :round_four, on: :member
  end

  resources :questions
  resources :teams
end
