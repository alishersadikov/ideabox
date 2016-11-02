require 'rails_helper'

describe 'User creates a new category' do
  context 'as an admin' do
    it 'they are able to create a category' do

      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_category_path

      expect(page).to have_content("Enter new category:")

      title = Faker::Lorem.word

      within "form" do
        fill_in "category[title]", with: title
        click_on "Create"
      end

      expect(page).to have_content("Category has been created!")
      expect(current_path).to eq("/admin/categories/#{Category.last.id}")
      expect(page).to have_content(title)
    end
  end

  context 'as a default user' do
    it 'they are shown a 404' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_category_path

      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
