require 'rails_helper'

describe 'User visits the admin users page' do
  context 'as an admin' do
    it 'they see Admin users' do

      category1, category2 = create_list(:category, 2)

      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path
      
      expect(page).to have_content("Admin Categories")
      expect(page).to have_content(category1.title)
      expect(page).to have_content(category2.title)
    end
  end

  context 'as a default user' do
    it 'they are shown a 404' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path

      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
