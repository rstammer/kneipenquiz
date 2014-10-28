require 'spec_helper'

describe GamesController do

  include Devise::TestHelpers

  before(:each) do
    controller.request.env["devise.mapping"] = Devise.mappings[:user]
    @user = User.first || FactoryGirl.create(:user)
    sign_in @user
  end

  describe 'POST create' do
    pending
  end

end
