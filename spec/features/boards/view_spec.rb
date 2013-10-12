require 'spec_helper'

describe "View Board", :js do
  let!(:board) { FactoryGirl.create(:board, name: "Test Board") }

  context "with no associated Slides" do
    it "does something that I haven't determined yet"
  end

  context "with associated Slides" do
    let!(:slide) { FactoryGirl.create(:slide, board: board) }

    it "is linked to from the boards page" do
      visit all_aboard.boards_path
      click_link "Test Board"
      expect(page).to have_content("Slide. id: #{slide.id}")
    end

    it "can be visited directly with deep linking" do
      visit all_aboard.root_path + "board/#{board.id}"
      expect(page).to have_content("Slide. id: #{slide.id}")
    end
  end
end
