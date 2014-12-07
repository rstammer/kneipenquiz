require 'spec_helper'

describe GamesController do

  include Devise::TestHelpers

  before(:each) do
    controller.request.env["devise.mapping"] = Devise.mappings[:user]
    @user = User.first || FactoryGirl.create(:user)
    sign_in @user
  end

  describe 'GET slides' do
    let(:game) { FactoryGirl.create(:game) }

    it 'returns slide number as text' do
      get :slides, { format: :js, slide_number: 42, game_id: game.id }
      expect(response.body).to eql "42"
    end
  end

end
