require 'rails_helper'

describe 'User uploads a new image' do
  context 'as an admin' do
    it 'they are able to upload an image' do

      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_image_path

      expect(page).to have_content("Upload a new image:")

      url = Faker::Lorem.word

      within "form" do
        fill_in "image[url]", with: url
        page.find("#image_avatar").click
        page.attach_file("image[avatar]", Rails.root + 'spec/Fixtures/pic.jpeg')
        click_on "Create"
      end

      save_and_open_page

      expect(page).to have_content("Image has been uploaded!")
      expect(current_path).to eq("/admin/images/#{Image.last.id}")

      expect(page).to have_content(url)
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
