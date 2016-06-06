require "rails_helper"

RSpec.feature "User logs out" do
  scenario "they are redirected to login page" do
    user = User.create(email: "email@example.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path
    click_on "Sign Out"

    expect(page).to have_content("You have been signed off.")
    expect(current_path).to eq(login_path)
  end
end
