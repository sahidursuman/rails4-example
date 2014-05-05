require 'spec_helper'

describe AdminController do
  login_user

  describe "GET 'index'" do
    it "returns http success as admin" do
      subject.current_user.role = 'admin'
      get 'index'
      response.should be_success
    end

    it "redirect user to home" do
      subject.current_user.role = 'user'
      get 'index'
      response.should redirect_to '/'
    end
  end

end
