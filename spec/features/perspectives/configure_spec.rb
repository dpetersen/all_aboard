require 'spec_helper'

describe "Configure perspective assignments", :js do
  let!(:board) { FactoryGirl.create(:board, name: "Test Board") }
  let!(:slide) { FactoryGirl.create(:slide, board: board) }

  it "can configure an assigned perspective" do
    FactoryGirl.create(:perspective_assignment, slide: slide)
    visit all_aboard.root_path + "board/#{board.id}/slide/#{slide.id}"

    within(".gridster ul") do
      page.first(".perspective-assignment").hover
      page.first("a.configure").click
    end

    fill_in "Format", with: "My Favorite Format"
    click_button "Save"
    expect(page).to have_field("Format", with: "My Favorite Format")

    click_link "Close"
    expect(page).to have_no_field("Format")
    expect(page).to have_content("I am the current time")
  end
end
