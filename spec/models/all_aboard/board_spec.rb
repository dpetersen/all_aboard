require 'spec_helper'

describe AllAboard::Board do
  it { should validate_presence_of(:name) }
end
