require 'rails_helper'

describe "User sees all ideas" do
  scenario "user sees all the ideas that belong to him/her" do
    category1, category2 = create_list(:category, 2)

    user = create(:user)
    login_user(user)
    visit new_idea_path(user)
    content = Faker::Lorem.word

    within "form" do
      fill_in "idea[content]", with: content
      select "#{category1.title}"
      click_on "Create Idea"
    end

    expect(current_path).to eq("/ideas/#{Idea.last.id}")
    expect(page).to have_content(content)
  end
end
