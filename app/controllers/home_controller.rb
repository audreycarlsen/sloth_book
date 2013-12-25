class HomeController < ApplicationController
  def index
    if current_user
      redirect_to 'users/newsfeed'
    else
      redirect_to log_in_path
    end
  end
end
