require 'spec_helper'

describe Post do

  it { expect(subject).to validate_presence_of(:title) }

end
