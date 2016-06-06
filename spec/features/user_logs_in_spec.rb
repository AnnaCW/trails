require 'rails_helper'

RSpec.feature "User logs in" do
  scenario "user logs in, sees 'logged in as' and logout button" do
    user = User.create(username: "User88", password: "password", password_confirmation: "password", role: 0)
    user_trail = user.trails.new(name: "Storm Mountain Route 153", city: "Fort Collins", state: "CO")
    user_trail.save
    other_trail_one, other_trail_two = create_list(:trail, 2)

    visit trails_path

    click_on "Sign In"

    fill_in "Username", with: "User88"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Login"

    within(".container") do
      expect(page).to have_content "Signed In As User88"
      expect(page).to have_content "Logout"
      expect(page).to have_no_content "Sign In"
    end
  end
end
