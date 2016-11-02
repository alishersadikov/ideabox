require 'rails_helper'

RSpec.describe "user can be created" do
  it 'creates a user' do
    visit new_user_path

    fill_in "user[username]", with: "Alex"
    fill_in "user[email]", with: "alex@great.com"
    fill_in "user[password]", with: "pword"
    fill_in "user[password_confirmation]", with: "pword"
    click_on "Create User"

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Successfully registered!")
    expect(page).to have_content("Welcome, Alex!")
  end
end
