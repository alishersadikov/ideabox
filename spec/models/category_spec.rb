require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without title" do
        category = Category.new

        expect(category).to be_invalid
      end

      it "is valid with title" do
        category = Category.new(title: "entrepreneurship")

        expect(category).to be_valid
      end
    end

      context "uniqueness" do
        it "is invalid if title is not unique" do
          category1 = Category.create(title: "entrepreneurship")
          category2 = Category.new(title: "entrepreneurship")

          expect(category2).to be_invalid
        end

        it "is valid if title is unique" do
          category1 = Category.create(title: "entrepreneurship")
          category2 = Category.new(title: "philosophy")

          expect(category2).to be_valid
        end
      end
  end

  describe "relationships" do
    it "has many ideas" do
      category = Category.new(title: "entrepreneurship")

      expect(category).to respond_to(:ideas)
    end
  end
end
