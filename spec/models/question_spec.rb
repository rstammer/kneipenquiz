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
    it { expect(subject).to have_many :categories }
  end

  context 'with validations' do
    it { expect(subject).to validate_presence_of(:answer) }
    it { expect(subject).to validate_presence_of(:typus) }
  end
end
