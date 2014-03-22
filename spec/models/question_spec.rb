require 'spec_helper'

describe Question do

  context 'with associations' do
    it { expect(subject).to belong_to :game }
  end

  context 'with validations' do
    it { expect(subject).to validate_presence_of(:answer) }
    it { expect(subject).to validate_presence_of(:answer) }
  end
end
