require 'spec_helper'

describe "View Board", :js do
  let!(:board) { FactoryGirl.create(:board, name: "Test Board") }

  context "with no associated Slides" do
    it "tells you what is going on" do
      visit all_aboard.root_path + "board/#{board.id}/slides"
      expect(page).to have_content("do not have any slides")
    end
  end

  context "with associated Slides" do
    let!(:slide) { FactoryGirl.create(:slide, board: board) }

    it "is linked to from the boards page and redirects to the first slide" do
      visit all_aboard.boards_path
      click_link "Test Board"
      expect(page).to have_content("slide with id #{slide.id}")
      expect(current_path).to eq(all_aboard.root_path + "board/#{board.id}/slide/#{slide.id}")
    end

    it "can be visited directly with deep linking" do
      visit all_aboard.root_path + "board/#{board.id}/slide/#{slide.id}"
      expect(page).to have_content("slide with id #{slide.id}")
    end
  end
end
