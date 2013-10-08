require 'spec_helper'

describe "Board List", :js do
  context "with no Boards in the database" do
    it "shows a helpful message" do
      visit engine_routes.boards_path
      expect(page).to have_content("No boards")
    end
  end

  context "with a Board in the database" do
    before { FactoryGirl.create(:board, name: "Test Board") }

    it "shows the board" do
      visit engine_routes.boards_path
      expect(page).to have_content("Test Board")
    end
  end
end
