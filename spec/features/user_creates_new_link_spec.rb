require "rails_helper"

RSpec.feature "User creates new link" do
  scenario "they see the link on the index page" do
    user = User.create(email: "email@example.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    fill_in "Link", with: "www.google.com"
    fill_in "Title", with: "Google"
    click_on "Submit"

    expect(page).to have_content("New Link Added")
    expect(page).to have_content("www.google.com")
    expect(page).to have_content("Google")
  end
end
