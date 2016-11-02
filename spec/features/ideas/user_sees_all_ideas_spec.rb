require 'rails_helper'

describe "User sees all ideas" do
  scenario "user sees all the ideas that belong to him/her" do
    user = create(:user)

    idea1, idea2 = create_list(:idea, 2)

    visit login_path

    within "form" do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Login"
    end

    visit ideas_path

    expect(page).to have_content(idea1.content)
    expect(page).to have_content(idea2.content)
  end
end
