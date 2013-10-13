require 'spec_helper'

describe AllAboard::Board do
  it { should have_many(:slides).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end
