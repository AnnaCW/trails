require 'rails_helper'

RSpec.feature "User views all trails" do
  scenario "user sees each trail name linked to trail page" do

    user = User.create(username: "helloworld", password: "password", password_confirmation: "password")
    trails = create_list(:trail, 3)

    visit trails_path

    trails.each do |trail|
      expect(page).to have_link trail.name, href: trail_path(trail)
    end

  end
end
