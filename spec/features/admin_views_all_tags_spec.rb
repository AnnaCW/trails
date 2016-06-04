require 'rails_helper'

RSpec.feature "Admin creates a tag" do
  scenario "logged in admin can view all tags" do
    admin = User.create(username: "Admin77", password: "password", password_confirmation: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_tags_path

    expect(page).to have_content("All Tags")
  end

  scenario "default user cannot view all tags" do
    user = User.create(username: "User88", password: "password", password_confirmation: "password", role: 0)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_tags_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
