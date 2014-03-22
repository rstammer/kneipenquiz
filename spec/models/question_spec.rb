require 'spec_helper'

describe Question do

  context 'with validations' do
    it { expect(subject).to belong_to :game }
  end

  it { expect(subject).to validate_presence_of(:content) }
  it { expect(subject).to validate_presence_of(:answer) }
end
