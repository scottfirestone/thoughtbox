require "rails_helper"

RSpec.feature "User can log in" do
  scenario "they are redirected to links index page" do
    User.create(email: "email@example.com", password: "password")
    visit login_path

    fill_in "Email", with: "email@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(current_path).to eq(links_path)
  end
end
