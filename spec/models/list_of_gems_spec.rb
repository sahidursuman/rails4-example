require 'rails_helper'
include Warden::Test::Helpers

describe ListOfGems do

  before :each do
    @current_user = create(:user, role: "user")
    login_as @current_user
    @list_of_gems = ListOfGems.new(columns: 4)
  end

  describe "initialize" do
    it "set the list of gems" do
      expect(@list_of_gems.gems).to be_kind_of(Array)
      expect(@list_of_gems.gems.any?).to be_truthy
      expect(@list_of_gems.gems[0]).to be_kind_of(String)
    end

    it "splits array of gems into sections" do
      expect(@list_of_gems.columns_gems).to be_kind_of(Array)
      expect(@list_of_gems.columns_gems.count).to eq(4)
    end
  end

  it "#select_gem will find devise gem listing" do
    expect(@list_of_gems.select_gem(/devise/)).to match(/devise/)
  end
end
