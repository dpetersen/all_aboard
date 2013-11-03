require 'spec_helper'

describe "Source view", :js do
  it "is linked to from the sources page" do
    visit all_aboard.root_path + "sources"
    click_link "Time"
    expect(page).to have_content("Timezone")
  end

  it "can link to a source directly" do
    visit all_aboard.root_path + "sources/time"
    expect(page).to have_content("Timezone")
    expect(page).to have_content("Current Time")
    expect(page).to have_content("The current time")
    expect(page).to have_content("2x1")
    expect(page).to have_content("4x4")
  end
end
