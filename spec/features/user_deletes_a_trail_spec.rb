require 'rails_helper'

RSpec.feature "User deletes a trail" do
  scenario "user sees trails list without deleted trail" do
    trail_one, trail_two, trail_three = create_list(:trail, 3)

    visit trail_path(trail_one)
    click_on "Delete"

    expect(page).to have_content(trail_three.name)
    expect(page).to have_no_content(trail_one.name)
  end
end
