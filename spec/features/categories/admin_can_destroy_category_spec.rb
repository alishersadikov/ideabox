require 'rails_helper'

describe 'User destroys an existing category' do
  context 'as an admin' do
    it 'they are able to delete a category' do

      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      category = create(:category)

      visit admin_category_path(category)

      expect(page).to have_content(category.title)

      click_on "Delete"

      expect(page).to_not have_content(category.title)
      expect(current_path).to eq(admin_categories_path)
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
