require 'spec_helper'

describe AllAboard::Slide do
  it { should belong_to(:board) }

  it { should validate_presence_of(:board) }
  it { should validate_presence_of(:position) }
end
