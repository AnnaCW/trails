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

  scenario "user cannot edit another user's trails" do
    user1 = User.create(username: "User1", password: "password1", password_confirmation: "password1", role: 0)
    user2 = User.create(username: "User2", password: "password2", password_confirmation: "password2", role: 0)
    ApplicationController.any_instance.stubs(:current_user).returns(user2)

    trail = Trail.create(name: "Storm Mountain Route 153", city: "Fort Collins", state: "CO", user_id: user1.id)

    visit edit_trail_path(trail)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
