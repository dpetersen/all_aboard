require 'spec_helper'

describe "Manage Slide", :js do
  let!(:board) { FactoryGirl.create(:board, name: "Test Board") }

  context "when no slide is assigned" do
    it "allows creation of a slide" do
      visit all_aboard.root_path + "board/#{board.id}/slides"
      click_button "Get Started"
      expect(page).to have_content("to add perspectives")
    end
  end
end
