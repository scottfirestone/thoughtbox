require "rails_helper"

RSpec.feature "User creates new account" do
  scenario "they are redirected to links index page" do
    visit login_path
    click_on "Register"

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "email@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Register"

    expect(current_path).to eq(links_path)
  end
end
