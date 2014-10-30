require 'rails_helper'

describe AdminController do
  login_user

  describe "GET 'index'" do
    it "returns http success as admin" do
      subject.current_user.role = 'admin'
      get 'index'
      expect(response).to be_success
    end

    it "redirect user to home" do
      subject.current_user.role = 'user'
      get 'index'
      expect(response).to redirect_to '/'
    end
  end

end
