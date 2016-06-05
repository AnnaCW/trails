require 'rails_helper'

RSpec.feature "User deletes a trail" do
  scenario "user sees trails list without deleted trail" do
    user1 = User.create(username: "User1", password: "password1", password_confirmation: "password1", role: 0)
    trail_one = Trail.create(name: "Storm Mountain Route 153", city: "Fort Collins", state: "CO", user_id: user1.id)
    trail_two = Trail.create(name: "Pikes Peak", city: "Manitou Springs", state: "CO", user_id: user1.id)
    ApplicationController.any_instance.stubs(:current_user).returns(user1)

    visit trail_path(trail_one)

    click_on "Delete"

    expect(page).to have_content(trail_two.name)
    expect(page).to have_no_content(trail_one.name)
  end

  scenario "user cannot delete another user's trails" do
    user1 = User.create(username: "User1", password: "password1", password_confirmation: "password1", role: 0)
    user2 = User.create(username: "User2", password: "password2", password_confirmation: "password2", role: 0)
    ApplicationController.any_instance.stubs(:current_user).returns(user2)

    trail = Trail.create(name: "Storm Mountain Route 153", city: "Fort Collins", state: "CO", user_id: user1.id)

    visit trail_path(trail)

    expect(page).to have_no_content("Delete")
  end
end
