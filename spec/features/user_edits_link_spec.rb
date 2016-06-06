require "rails_helper"

RSpec.feature "User edits link" do
  scenario "they see the new link info" do
    user = User.create(email: "email@example.com", password: "password")
    link = user.links.create(url: "http://www.google.com", title: "google")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    url = find(:xpath,"//*[normalize-space()='http://www.google.com']", match: :first)
    url.click
    # title.sendKeys("Updated-Title")
    title = find(:xpath,"//*[normalize-space()='google']", match: :first)
    title.click
  end
end
