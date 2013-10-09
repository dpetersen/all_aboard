require 'spec_helper'

describe "Login support", :js do
  context "not logged in" do
    it "shows a login link" do
      visit engine_routes.root_path
      expect(page).to have_link("Log in", href: login_path)
    end
  end

  context "logged in" do
    before { log_in }

    it "doesn't show a login link" do
      visit engine_routes.root_path
      expect(page).to have_no_link("Log in")
    end
  end
end
