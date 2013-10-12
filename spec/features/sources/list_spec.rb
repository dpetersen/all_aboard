require 'spec_helper'

describe "Source List", :js do
  context "when not an admin user" do
    it "does not see a link to sources" do
      visit all_aboard.boards_path
      expect(page).to have_no_link("Sources")
    end
  end

  context "when an admin user" do
    before { log_in }

    it "can see a list of registered sources" do
      visit all_aboard.boards_path
      click_link "Sources"
      expect(page).to have_content("Time")
    end
  end
end
