require 'rails_helper'

RSpec.feature "User logs out" do
  scenario "logged in user can logout" do
    user = User.create(username: "anna123", password: "password", password_confirmation: "password")

    visit login_path
    fill_in "Username", with: "anna123"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Login"

    expect(page).to have_content("Signed In As anna123")

    click_on "Logout"
    expect(page).to have_no_content("Signed In As")

  end
end
