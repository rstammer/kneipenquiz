require 'spec_helper'

describe QuestionsController do

  include Devise::TestHelpers

  before do
    Question::CATEGORIES.keys.each do |cat|
      Category.create title: Question::CATEGORIES[cat][:title]
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
        post :create, valid_params.merge!({ category_mappings: { "Politik" => '1' } })
      end.to change { CategoryMapping.count }.by(1)
    end
  end

  describe 'PATCH update' do
    context 'autotags handling' do
      let(:question) { FactoryGirl.create :question }

      it 'tags question as unused if no game present' do
        expect(question.game).to be_blank
        expect {
          patch :update, { id: question.id, question: { answer: '3.14159' } }
        }.to change { question.reload.tag_list }.by(['unbenutzt'])
      end

      it 'removes unused-tag' do
        question.tag_list.add('unbenutzt')
        question.game = FactoryGirl.create :game
        question.save

        patch :update, { id: question.id, question: { answer: '3.14159' } }
        expect(question.reload.tag_list).not_to include('unbenutzt')
      end

    end

    it 'deletes category mapping when selected' do
      question = FactoryGirl.create :question
      question.category_mappings.create category: @category

      expect do
        patch :update, { id: question.id, category_mappings: { "Politik" => "0" } }
      end.to change { CategoryMapping.count }.by(-1)
    end
  end
end
