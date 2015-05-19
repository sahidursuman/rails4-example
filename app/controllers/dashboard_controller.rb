class DashboardController < ApplicationController
  skip_authorization_check only: [:index]

  def index
    @lists_of_gems = ListOfGems.new(columns: 4)
  end
end
