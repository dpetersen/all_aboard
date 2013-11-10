require 'spec_helper'

describe "Style perspective assignments", :js do
  let!(:board) { FactoryGirl.create(:board, name: "Test Board") }
  let!(:slide) { FactoryGirl.create(:slide, board: board) }
  before do
    FactoryGirl.create(:perspective_assignment, slide: slide)
  end

  it "includes styling hooks for the assignments" do
    visit all_aboard.root_path + "board/#{board.id}/slide/#{slide.id}"

    within(".gridster ul") do
      expect(page).to have_css(".perspective-assignment.time.current_time.x2x1")
    end
  end
end
