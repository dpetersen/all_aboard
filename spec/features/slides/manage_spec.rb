require 'spec_helper'

describe "Manage Slide", :js do
  let!(:board) { FactoryGirl.create(:board, name: "Test Board") }

  context "when no slide is assigned" do
    it "allows creation of a slide" do
      visit all_aboard.root_path + "board/#{board.id}/slides"
      click_button "Get Started"
      expect(page).to have_content("I am displaying a slide")
      expect(page).to have_content("No perspectives")
    end
  end

  context "when a slide is assigned" do
    let!(:slide) { FactoryGirl.create(:slide, board: board) }

    # Not wonderful, but it ensures that the hooks are in place that assign
    # panes to the next available position.
    it "can assign perspectives" do
      visit all_aboard.root_path + "board/#{board.id}/slide/#{slide.id}"
      click_link "Add stuff"
      click_button "2x1"
      expect(page).to have_content("I am the current time")

      click_button "2x1"
      visit all_aboard.root_path + "board/#{board.id}/slide/#{slide.id}"
      within(".gridster ul") do
        items = page.all("li")
        expect(items[0]["data-row"]).to eq("1")
        expect(items[0]["data-col"]).to eq("1")
        expect(items[1]["data-row"]).to eq("1")
        expect(items[1]["data-col"]).to eq("3")
      end
    end

    it "can remove an assigned perspective" do
      FactoryGirl.create(:perspective_assignment, slide: slide)
      visit all_aboard.root_path + "board/#{board.id}/slide/#{slide.id}"
      expect(page).to have_content("I am the current time")
      within(".gridster ul") do
        click_button ("X")
      end

      expect(page).to have_no_content("I am the current time")
    end

    it "can configure an assigned perspective" do
      FactoryGirl.create(:perspective_assignment, slide: slide)
      visit all_aboard.root_path + "board/#{board.id}/slide/#{slide.id}"
      fill_in "Format", with: "My Favorite Format"
      click_button "Save"
      expect(page).to have_field("Format", with: "My Favorite Format")

      visit all_aboard.root_path + "board/#{board.id}/slide/#{slide.id}"
      expect(page).to have_field("Format", with: "My Favorite Format")
    end
  end
end
