require 'spec_helper'

describe "Configure perspective assignments", :js do
  let!(:board) { FactoryGirl.create(:board, name: "Test Board") }
  let!(:slide) { FactoryGirl.create(:slide, board: board) }

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
