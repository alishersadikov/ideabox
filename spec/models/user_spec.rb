require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a username" do
        user = User.new(email: "user@gmail.com", password: "pw")
        expect(user).to be_invalid
      end

      it "is invalid without an email" do
        user = User.new(username: "username", password: "pw")
        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.new(username: "username", email: "user@gmail.com")
        expect(user).to be_invalid
      end

      it "is valid with all attributes" do
        user = User.new(username: "username", email: "user@gmail.com", password: "pw")
        expect(user).to be_valid
      end
    end

    context "uniqueness" do
      it "is invalid if email is not unique" do
        user1 = User.create(username: "username", email: "user@gmail.com", password: "pw")
        user2 = User.new(username: "name", email: "user@gmail.com", password: "password")
        expect(user2).to be_invalid
      end

      it "is valid if email is unique" do
        user1 = User.create(username: "username", email: "user@gmail.com", password: "pw")
        user2 = User.new(username: "name", email: "name@gmail.com", password: "password")
        expect(user2).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many ideas" do
      user = User.new(username: "username", email: "user@gmail.com", password: "pw")
      expect(user).to respond_to(:ideas)
    end
  end
end
