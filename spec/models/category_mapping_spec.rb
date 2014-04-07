require 'spec_helper'

describe CategoryMapping do

  let(:category) { FactoryGirl.create(:category) }
  let(:question) { FactoryGirl.create(:question) }

  context 'with associations' do
    it { expect(subject).to belong_to :question }
    it { expect(subject).to belong_to :category }
  end

  context 'with class methods' do
    describe '#map' do
      it 'returns existing mapping' do

      end
    end
  end

end
