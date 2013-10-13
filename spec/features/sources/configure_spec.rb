require 'spec_helper'

describe "Source configuring", :js do
  it "can link to a source directly" do
    visit all_aboard.root_path + "source/time"
    expect(page).to have_no_button("Save")
    fill_in "Timezone", with: "PST"
    click_button "Save"
    expect(page).to have_no_button("Save")
    expect(page).to have_field("Timezone", with: "PST")

    visit all_aboard.root_path + "source/time"
    expect(page).to have_field("Timezone", with: "PST")
  end
end
