require 'spec_helper'

describe AllAboard::BoardSerializer do
  let(:board) { FactoryGirl.create(:board, name: "Test Board Name") }
  subject { AllAboard::BoardSerializer.new(board).as_json[:board] }

  its([:id]) { should eq(board.id) }
  its([:name]) { should eq("Test Board Name") }
  its([:slides]) { should be_empty }

  context "with associated slides" do
    let!(:slide) { FactoryGirl.create(:slide, board: board) }
    its([:slides]) { should eq([ slide.id ]) }
  end
end
