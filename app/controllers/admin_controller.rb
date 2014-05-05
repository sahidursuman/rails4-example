class AdminController < ApplicationController

  before_action :authenticate_user!
  before_action do |chk|
    chk.send(:check_access_level, 'manager')
  end

  def index
    @users = User.order('role,username')
    authorize! :read, @users
  end

end
