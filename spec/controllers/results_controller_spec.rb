require 'spec_helper'

describe ResultsController do

  include Devise::TestHelpers

  before(:each) do
    controller.request.env["devise.mapping"] = Devise.mappings[:user]
    @user = User.first || FactoryGirl.create(:user)
    sign_in @user
  end

  let(:game) { FactoryGirl.create(:game) }
  let(:team) { FactoryGirl.create(:team) }

  let(:valid_params) do
    {
      game_id: game.id,
      scores: {
        team.id => { 1 => 1, 2 => 2, 3 => 3, 4 => 4 }
      }
    }
  end

  describe 'POST create' do
    it 'creates a category mapping when selected' do
      expect do
        post :create, valid_params
      end.to change { team.results.count }.by(1)
    end
  end
end
