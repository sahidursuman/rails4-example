class AdminController < ApplicationController

  before_filter :authenticate_user!
  before_filter do |c|
    c.send(:check_access_level, 'manager')
  end
  
  def index
    @users = User.order("role,username")
    authorize! :read, @users
  end
  
end
