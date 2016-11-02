
require 'rails_helper'

describe "Admin sees one company" do
  scenario "admin sees a user" do
    user = create(:user)

    visit login_path

    within "form" do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Login"
    end

    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Welcome, #{user.username}!")
    expect(page).to have_content("Logout")
  end
end
