class DashboardController < ApplicationController
  def index
    @referer = request.referer
    @remote_ip = request.remote_ip
  end
end
