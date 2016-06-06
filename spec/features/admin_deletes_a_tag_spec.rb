require 'rails_helper'

RSpec.feature "Admin edits a tag" do
  scenario "logged in admin deletes a tag, sees updated tag index page" do
    admin = User.create(username: "Admin22", password: "password", password_confirmation: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    # rspec comes with allow_any_instance_of(ApplicationController).to accept(:current_user).and_return(user)
    # you can use that built in rspec stub in place of mocha so you don't need to bring in the outside library
    
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
