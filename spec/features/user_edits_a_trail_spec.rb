# require 'rails_helper'
#
# RSpec.feature "User edits a trail" do
#   scenario "user sees updated name" do
#
#     trail = create(:trail)
#
#     visit trail_path(trail)
#     click_on "Edit"
#     fill_in "Name", with: "Stormy Mountain"
#     click_on "Update"
#
#     expect(page).to have_content "Stormy Mountain"
#     expect(page).to have_no_content "153"
#
#   end
# end
