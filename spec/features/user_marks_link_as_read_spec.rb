require "rails_helper"

RSpec.feature "User marks link as read", js: true do
  scenario "the link is then marked as read" do
    user = User.create(email: "email@example.com", password: "password")
    link = user.links.create(url: "http://www.google.com", title: "google")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    expect(link.read).to eq(false)

    visit links_path

    click_on "Mark as Read"

    expect(current_path).to eq(links_path)

    expect(page).to have_button("Mark as Unread")
    expect(page).to_not have_button("Mark as Read")
  end
end
