require 'spec_helper'

describe Question do

  it { expect(subject).to validate_presence_of(:content, :answer) }

end
