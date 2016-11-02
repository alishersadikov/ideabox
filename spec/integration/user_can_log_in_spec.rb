require 'rails_helper'

RSpec.describe "user can log in" do
  it "enables login" do

    user = User.create(username: "Alex", email: "alex@great.com", password: "pass")

    visit login_path

    within("form") do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Login"
    end

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Successfully logged in!")
    expect(page).to have_content("Welcome, Alex!")
    expect(page).to have_content("Logout")
  end
end
