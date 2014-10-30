require 'rails_helper'

describe DashboardController do
  login_user

  it "should have a current_user" do
    expect(subject.current_user).to_not be_nil
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

end
