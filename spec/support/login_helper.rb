module LoginHelper
  def log_in
    visit login_path
    click_button "Secure Login!!!1!"
    expect(page).to have_content("session: true")
    expect(page).to have_content("#can_manage_boards?: true")
  end
end

RSpec.configure do |config|
  config.include LoginHelper, type: :feature
end
