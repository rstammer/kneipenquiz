require 'spec_helper'

describe Game do

  context 'with associations' do
    it { expect(subject).to have_many :questions }
  end

end
