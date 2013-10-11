require 'spec_helper'

describe "Board creation", :js do
  context "not logged in" do
    it "doesn't show the board creation form" do
      visit all_aboard.boards_path
      expect(page).to have_no_content("Name")
    end
  end

  context "logged in" do
    before { log_in }

    it "can create a board" do
      visit all_aboard.boards_path
      fill_in "Name", with: "New Board Name"
      click_button "Create"
      expect(page).to have_content("Saving New Board Name...")
      expect(page).to have_link("New Board Name")

      click_link "New Board Name"
      within(".board-title") do
        expect(page).to have_content("New Board Name")
      end
    end
  end
end
