require 'spec_helper'

describe "Source view", :js do
  it "is linked to from the sources page" do
    visit all_aboard.root_path + "sources"
    click_link "Time"
    expect(page).to have_content("Timezone")
  end

  it "can link to a source directly" do
    visit all_aboard.root_path + "source/time"
    expect(page).to have_content("Timezone")
  end
end
