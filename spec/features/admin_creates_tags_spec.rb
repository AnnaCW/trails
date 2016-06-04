require 'rails_helper'

RSpec.feature "Admin creates tags" do
  scenario "logged in admin creates new tag, sees all tags" do
    admin = User.create(username: "Admin22", password: "password", password_confirmation: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    current_tags = create_list(:tag, 3)

    visit admin_tags_path

    click_on "New Tag"
    fill_in "Name", with: "14er"
    click_on "Create Tag"

    expect(page).to have_content ("14er")
  end

  scenario "default user cannot create a tag" do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit new_admin_tag_path

    expect(page).to have_content ("The page you were looking for doesn't exist")
  end
end
