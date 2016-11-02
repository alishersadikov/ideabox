require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        user = create(:user)
        category = create(:category)
        idea = Idea.new(user_id: user.id, category_id: category.id)

        expect(idea).to be_invalid
      end

      it "is invalid without category_id" do
        user = create(:user)
         idea = Idea.new(content: "great content ", user_id: user.id)

        expect(idea).to be_invalid
      end

      it "is invalid without category_id" do
        user = create(:user)
        category = create(:category)
        idea = Idea.new(content: "great content ", user_id: user.id)

        expect(idea).to be_invalid
      end

      it "is invalid without user_id" do
        user = create(:user)
        category = create(:category)
        idea = Idea.new(content: "great content ", category_id: category.id)

        expect(idea).to be_invalid
      end

      it "is valid with all attributes" do
        user = User.create(username: "username", email: "user@gmail.com", password: "pw")
        category = Category.create(title: "personal development")
        idea = Idea.new(content: "great content", user_id: user.id, category_id: category.id)

        expect(idea).to be_valid
      end

      context "uniqueness" do
        it "is invalid if content is not unique" do
          user = create(:user)
          category = create(:category)

          idea1 = Idea.create(content: "great content", user_id: user.id, category_id: category.id)
          idea2 = Idea.new(content: "great content", user_id: user.id, category_id: category.id)

          expect(idea2).to be_invalid
        end

        it "is valid if content is unique" do
          user = create(:user)
          category = create(:category)

          idea1 = Idea.create(content: "great content", user_id: user.id, category_id: category.id)
          idea2 = Idea.new(content: "other content", user_id: user.id, category_id: category.id)

          expect(idea2).to be_valid
        end
      end
    end
  end

  describe "relationships" do
    it "belongs to a category" do
      user = create(:user)
      category = create(:category)
      idea = Idea.new(content: "great content", user_id: user.id, category_id: category.id)

      expect(idea).to respond_to(:category)
    end
    it "belongs to a user" do
      user = create(:user)
      category = create(:category)
      idea = Idea.new(content: "great content", user_id: user.id, category_id: category.id)

      expect(idea).to respond_to(:user)
    end
  end
end
