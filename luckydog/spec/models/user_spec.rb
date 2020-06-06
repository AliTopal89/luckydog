require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'ensures email presence' do
      user = User.new(name: 'username', password: '123').save
      expect(user).to eq(false)
    end

    it 'should have no userss registered initially.' do
      expect(User.count).to eq(0)
    end

    it 'should not be logged on initially.' do
      expect(@current_user).to eq(nil)
    end

    it "is valid with a name, email, and password" do
      user = User.new(
        name: "Aaron",
        email:      "tester@example.com",
        password:   "secret",
      )
      expect(user).to be_valid
    end

    it "is invalid with a duplicate email address" do
      User.create(
        name:  "Joe",
        email:      "tester@example.com",
        password:   "sw!tchBackTa1l",
      )
      user = User.new(
        name:  "Jane",
        email:      "tester@example.com",
        password:   "sw!tchBackTa1l",
      )
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end
  end
end
