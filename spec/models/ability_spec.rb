require 'rails_helper'
include Warden::Test::Helpers

describe Ability do

  describe "User Role" do
    before :each do
      @user = create(:user, role: "user")
      login_as @user
      @ability = Ability.new(@user)
    end

    it "can :read users" do
      expect(@ability).to be_able_to(:read, User.new)
    end
    it "cannot :manage users" do
      expect(@ability).to_not be_able_to(:manage, User.new)
    end
  end

  describe "Manager Role" do
    before :each do
      @user = create(:user, role: "manager")
      login_as @user
      @ability = Ability.new(@user)
    end

    it "can :read users" do
      expect(@ability).to be_able_to(:read, User.new)
    end
    it "can :create users" do
      expect(@ability).to be_able_to(:create, User.new)
    end
    it "cannot :destroy users" do
      expect(@ability).to_not be_able_to(:destroy, User.new)
    end
  end

  describe "Admin Role" do
    before :each do
      @user = create(:user, role: "admin")
      login_as @user
      @ability = Ability.new(@user)
    end

    it "can :read users" do
      expect(@ability).to be_able_to(:read, User.new)
    end
    it "can :manage users" do
      expect(@ability).to be_able_to(:manage, User.new)
    end
  end
end
