require 'rails_helper'

describe "Admin sees all users" do
  scenario "admin sees all the users" do
    user1, user2 = create_list(:user, 2)

    visit login_path

    within "form" do
      fill_in "email", with: user1.email
      fill_in "password", with: user1.password
      click_on "Login"
    end

    visit users_path

    expect(page).to have_content(user1.username)
    expect(page).to have_content(user2.username)
  end
end
