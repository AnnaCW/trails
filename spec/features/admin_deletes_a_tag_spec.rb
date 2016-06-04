require 'rails_helper'

RSpec.feature "Admin edits a tag" do
  scenario "logged in admin deletes a tag, sees updated tag index page" do
    admin = User.create(username: "Admin22", password: "password", password_confirmation: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    tag_one, tag_two, tag_three = create_list(:tag, 3)

    visit admin_tags_path

    click_link tag_one.name

    click_on "Delete"

    expect(page).to have_content tag_three.name
    expect(page).to have_no_content tag_one.name
  end

  scenario "default user cannot delete a tag" do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    tag = create(:tag)

    visit admin_tags_path

    expect(page).to have_content ("The page you were looking for doesn't exist")
  end

end
