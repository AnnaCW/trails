require 'rails_helper'

RSpec.feature "User submits a new trail" do
  scenario "user sees the page for the individual trail" do

  trail = create(:trail)

  visit trails_path
  click_on "New Trail"
  fill_in "Name", with: trail.name
  fill_in "Image path", with: trail.image_path
  click_on "Create Trail"

  expect(page).to have_content trail.name
  expect(page).to have_css("img[src=\"#{trail.image_path}\"]")
  end
end
