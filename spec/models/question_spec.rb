require 'spec_helper'

describe Question do

  context 'with constants' do
    it 'defines types' do
      expect(described_class::TYPES).to eql [
        'normal', 'Multiple-Choice', 'Schätzfrage', 'Worträtsel',
        'Bilderrätsel', 'Musik'
      ]
    end
  end

  context 'with associations' do
    it { expect(subject).to belong_to :game }
    it { expect(subject).to have_many :category_mappings }
  end

  context 'with validations' do
    it { expect(subject).to validate_presence_of(:answer) }
    it { expect(subject).to validate_presence_of(:typus) }
  end

  context 'with instance methods' do
    describe '.has_category?' do
      let(:question) { FactoryGirl.create(:question) }
      let(:category) { FactoryGirl.create(:category) }
      let(:category_mapping)  { CategoryMapping.create category_id: category.id, question_id: question.id }

      it 'detects category by title' do
        question
        category
        category_mapping
        expect(question.has_category?(category.title)).to be_true
      end

      it 'is false when no category mapping present' do
        expect(question.has_category? :tnetenbra).to be_false
      end
    end
  end

end
