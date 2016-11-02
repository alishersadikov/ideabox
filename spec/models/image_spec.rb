require 'rails_helper'

RSpec.describe Image, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without url" do
        image = Image.new

        expect(image).to be_invalid
      end

      it "is valid with url" do
        image = Image.new(url: "wwww.website.com")

        expect(image).to be_valid
      end

      context "uniqueness" do
        it "is invalid if url is not unique" do

          image1 = Image.create(url: "www.website.com")
          image2 = Image.new(url: "www.website.com")

          expect(image2).to be_invalid
        end

        it "is valid if url is unique" do
          user = create(:user)
          category = create(:category)

          image1 = Image.create(url: "www.website.com")
          image2 = Image.new(url: "www.anotherwebsite.com")

          expect(image2).to be_valid
        end
      end
    end
  end

  describe "relationships" do
    it "has many ideas" do
      image = Image.new(url: "www.website.com")

      expect(image).to respond_to(:ideas)
    end
  end
end
