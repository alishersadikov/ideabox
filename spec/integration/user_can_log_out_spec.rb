require 'rails_helper'

RSpec.describe "Logged in user clicks 'Logout'" do
  it "they are successfully logged out" do

    user = User.create(username: "Alex", email: "alex@great.com", password: "pass")

    visit login_path

    within("form") do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Login"
    end

    click_on "Logout"

    expect(page).to have_content("Successfully logged out!")
    expect(page).to have_content("Login")
  end
end
