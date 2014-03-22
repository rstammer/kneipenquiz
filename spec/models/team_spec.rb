require 'spec_helper'

describe Team do

  it { expect(subject).to validate_presence_of(:title) }

end
