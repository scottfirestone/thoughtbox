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

  scenario "registration rejected due to password not matching password conf" do
    visit login_path
    click_on "Register"

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "email@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "not-password"

    click_on "Register"

    expect(current_path).to_not eq(links_path)
    expect(page).to have_content("There was a problem.")
  end
end
