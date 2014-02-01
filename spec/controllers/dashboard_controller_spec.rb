require 'spec_helper'

describe DashboardController do
  login_user

  it "should have a current_user" do
    subject.current_user.should_not be_nil
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
