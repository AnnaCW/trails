require 'rails_helper'

RSpec.feature "User creates new trail" do
  scenario "logged in user creates new trail" do

  user = User.create(username: "User88", password: "password", password_confirmation: "password", role: 0)
  ApplicationController.any_instance.stubs(:current_user).returns(user)
  image_url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz52PqqYbLtQGkKuiKmAx5YkylHCpmNUuXyCbZnyFpS4DhEKKy"
  tag_one, tag_two, tag_three = create_list(:tag, 3)

  visit trails_path
  click_on "New Trail"
  fill_in "Name", with: "Storm Mountain"
  fill_in "Image path", with: image_url
  fill_in "City", with: "Fort Collins"
  fill_in "State", with: "CO"
  # select("11 Name", from: "Tag Ids")
  fill_in "Description", with: "Keytar williamsburg bitters, pitchfork banh mi distillery green juice forage lo-fi VHS thundercats church-key 3 wolf moon blue bottle disrupt. VHS celiac wolf locavore slow-carb hella, sriracha kinfolk poutine portland schlitz fashion axe pug meditation. Tousled ethical cray tofu crucifix brooklyn, mixtape pug farm-to-table single-origin coffee shoreditch seitan."
  click_on "Create Trail"

  expect(page).to have_content "Storm Mountain"
  expect(page).to have_css("img[src=\"#{image_url}\"]")
  end
end
