require 'spec_helper'

describe AllAboard::SlideSerializer do
  let(:board) { FactoryGirl.create(:board) }
  let(:slide) { FactoryGirl.create(:slide, board: board) }
  subject { AllAboard::SlideSerializer.new(slide).as_json[:slide] }

  its([:id]) { should eq(slide.id) }
  its([:board_id]) { should eq(board.id) }
end
