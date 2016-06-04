require 'rails_helper'

RSpec.feature "Admin edits a tag" do
  scenario "logged in admin edits a tag, sees tag show page" do
    admin = User.create(username: "Admin22", password: "password", password_confirmation: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    tag = Tag.create(name: "Hilly")

    visit admin_tags_path

    click_link "Hilly"

    click_on "Edit"
    fill_in "Name", with: "Steep"
    click_on "Update"

    expect(page).to have_content ("Steep")
    expect(page).to have_no_content("Hilly")
  end

  scenario "default user cannot edit a tag" do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    tag = create(:tag)

    visit edit_admin_tag_path(tag)

    expect(page).to have_content ("The page you were looking for doesn't exist")
  end

end
