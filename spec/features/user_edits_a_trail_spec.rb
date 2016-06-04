require 'rails_helper'

RSpec.feature "User edits a trail" do
  scenario "logged in user edits trail created by that user" do
    user = User.create(username: "User88", password: "password", password_confirmation: "password", role: 0)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    trail = user.trails.new(name: "Storm Mountain Route 153", city: "Fort Collins", state: "CO")
    trail.save

    visit trail_path(trail)
    click_on "Edit"
    fill_in "Name", with: "Stormy Mountain"
    click_on "Update"

    expect(page).to have_content "Stormy Mountain"
    expect(page).to have_no_content "153"

  end
end
