require 'spec_helper'

describe QuestionsController do

  include Devise::TestHelpers

  before do
    Question::CATEGORIES.keys.each do |cat|
      Category.create title: Question::CATEGORIES[cat]
    end
  end

  before(:each) do
    controller.request.env["devise.mapping"] = Devise.mappings[:user]
    @user = User.first || FactoryGirl.create(:user)
    sign_in @user

    CategoryMapping.delete_all
    @category = Category.find_by! title: 'Politik'
  end

  let(:valid_params) do
    {
      title:   'blurgh',
      content: 'some content',
      answer:  '42'
    }
  end

  describe 'POST create' do
    it 'creates a category mapping when selected' do
      expect do
        post :create, valid_params.merge!({ category_mappings: { "politics" => '1' } })
      end.to change { CategoryMapping.count }.by(1)
    end
  end

  describe 'PATCH update' do
    it 'deletes category mapping when selected' do
      question = FactoryGirl.create :question
      CategoryMapping.create question: question, category: @category

      expect do
        patch :update, { id: question.id, category_mappings: { "politics" => '0' } }
      end.to change { question.category_mappings.count }
    end
  end
end
