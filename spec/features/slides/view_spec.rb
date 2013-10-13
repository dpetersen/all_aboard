require 'spec_helper'

describe "View Slide", :js do
  let!(:board) { FactoryGirl.create(:board, name: "Test Board") }
  let!(:slide) { FactoryGirl.create(:slide, board: board) }

  context "with no PerspectiveAssignments" do
    it "shows a helpful message" do
      visit all_aboard.root_path + "board/#{board.id}/slide/#{slide.id}"
      expect(page).to have_content("No perspectives")
    end
  end

  context "with PerspectiveAssignments" do
    before do
      FactoryGirl.create(
        :perspective_assignment,
        slide: slide, template_id: "time:current_time:2x1", column: 3, row: 4
      )
    end

    it "shows the assigned perspective" do
      visit all_aboard.root_path + "board/#{board.id}/slide/#{slide.id}"
      expect(page).to have_content("I am the current time")
    end
  end
end
