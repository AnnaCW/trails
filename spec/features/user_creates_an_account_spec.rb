require 'rails_helper'

RSpec.feature "User creates an account" do
  scenario "user sees signed in message and username" do

  visit new_user_path

  fill_in "Username", with: "Anna"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_on "Create Account"

  expect(page).to have_content("Signed In As Anna")

  end
end
