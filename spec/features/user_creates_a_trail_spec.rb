require 'rails_helper'

RSpec.feature "User submits a new trail" do
  scenario "user sees the page for the individual trail" do

  trail_name = "Storm Mountain Rt 153"
  trail_image_path = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz52PqqYbLtQGkKuiKmAx5YkylHCpmNUuXyCbZnyFpS4DhEKKy"

  visit trails_path
  click_on "New Trail"
  fill_in "trail_name", with: trail_name
  fill_in "trail_image_path", with: trail_image_path
  click_on "Create Trail"

  expect(page).to have_content trail_name
  expect(page).to have_css("img[src=\"#{trail_image_path}\"]")
  end
end
