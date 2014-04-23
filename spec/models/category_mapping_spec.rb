require 'spec_helper'

describe CategoryMapping do

  let(:category) { FactoryGirl.create(:category) }
  let(:question) { FactoryGirl.create(:question) }

  context 'with associations' do
    it { expect(subject).to belong_to :question }
    it { expect(subject).to belong_to :category }
  end

  context 'with class methods' do
    describe '.map' do

      it 'does nothing if category with given title doesnt exist' do
        expect {
          described_class.map(question , 'bullshit')
        }.not_to change { question.reload.category_mappings.count }
      end

      it 'creates mapping' do
        Category.delete_all
        CategoryMapping.delete_all

        expect {
          described_class.map(question , category.title)
        }.to change { question.reload.category_mappings.count }.by(1)
      end

      it 'returns existing mapping' do
        Category.delete_all
        existent_mapping = CategoryMapping.create category: category, question: question

        expect {
          expect(described_class.map(question , category.title)).to eql existent_mapping
        }.not_to change { question.reload.category_mappings.count }
      end

    end
    describe '.unmap' do
      it 'does nothing if category with given title doesnt exist' do
        question.category_mappings.create category: category

        expect {
          described_class.unmap(question , 'bullshit')
        }.not_to change { question.reload.category_mappings.count }
      end

      it 'deletes existing mappings' do
        Category.delete_all
        CategoryMapping.delete_all

        question.category_mappings.create category: category

        expect {
          described_class.unmap(question , category.title)
        }.to change { question.category_mappings.count }.to(0)
      end


    end
  end

end
