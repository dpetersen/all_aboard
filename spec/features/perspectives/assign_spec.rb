require 'spec_helper'

describe "Manage perspective assignment", :js do
  let!(:board) { FactoryGirl.create(:board, name: "Test Board") }
  let!(:slide) { FactoryGirl.create(:slide, board: board) }

  # Not wonderful, but it ensures that the hooks are in place that assign
  # panes to the next available position.
  it "can assign perspectives" do
    visit all_aboard.root_path + "board/#{board.id}/slide/#{slide.id}"
    click_link "Add stuff"
    click_button "2x1"
    expect(page).to have_content("I am the current time")
    click_button "2x1"

    # Has to stay commented until we fix the "two clicks and you're out" bug:
    # https://www.pivotaltracker.com/story/show/59505760
    #click_link "Close"
    #expect(page).to have_no_button("2x1")
    #expect(page).to have_content("I am the current time")

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
end
