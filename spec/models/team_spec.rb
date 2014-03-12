require 'spec_helper'

describe Team do

  it { expect(subject).to validate_presence_of(:title) }
  it { expect(subject).to have_many(:players) }

end
