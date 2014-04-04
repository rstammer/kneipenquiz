require 'spec_helper'

describe CategoryMappings do

  context 'with associations' do
    it { expect(subject).to belong_to :question }
    it { expect(subject).to belong_to :category }
  end

end
