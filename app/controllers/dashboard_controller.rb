class DashboardController < ApplicationController
  def index
    @total_visits = Visitor.all.count
  end
end
