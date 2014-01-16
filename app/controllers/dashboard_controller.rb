class DashboardController < ApplicationController
  def index
    @unique_visitors = Visitor.all.count
    @new_visitors = Visitor.all.where(visit_count: 1).count
    @returning_visitors = @unique_visitors - @new_visitors
    @firefox_users = Visitor.all.where(browser: "Firefox").count
    @chrome_users = Visitor.all.where(browser: "Chrome").count
    @safari_users = Visitor.all.where(browser: "Safari").count
    @ie_users = Visitor.all.where(browser: "Internet Explorer").count
  end
end
