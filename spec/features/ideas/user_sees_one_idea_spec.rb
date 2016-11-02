require 'rails_helper'

describe "User sees all ideas" do
  scenario "user sees all the ideas that belong to him/her" do

    idea = create(:idea)

    login_user

    visit idea_path(idea)

    expect(page).to have_content(idea.content)
  end
end
