require 'spec_helper'

describe User do
  context 'with validations' do
    before do
      User.delete_all
      FactoryGirl.create_list(:user, 2)
    end

    it 'allows only two users' do
      expect(User.count).to eql 2
      visitor = FactoryGirl.build(:user)
      expect(visitor).not_to be_valid
    end
  end
end
