module Admin
  class DashboardController < ApplicationController
    before_filter :authenticate_user!
    layout 'admin'

    def index
      @users = User.all
    end
  end
end



