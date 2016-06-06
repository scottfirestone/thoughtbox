require "rails_helper"

RSpec.feature "Root path points to signing in or up" do
  scenario "the visitor sees links to sign in or sign up" do
    visit root_path

    expect(current_path).to eq(login_path)
    expect(page).to have_link("Login")
    expect(page).to have_link("Register")
  end
end
