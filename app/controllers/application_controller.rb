class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_visitor
  before_action :update_pageview_count
  before_action :update_visit_count

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_visitor
    if session[:visitor_id]
      @current_visitor = Visitor.find(session[:visitor_id])
    elsif cookies.permanent[:visitor_id] && Visitor.find_by(cookie_id: cookies.permanent[:visitor_id])
      @current_visitor = Visitor.find_by(cookie_id: cookies.permanent[:visitor_id])
      session[:visitor_id] = @current_visitor.id
    else
      cookies.permanent[:visitor_id] = rand(1000000000000000000)
      @current_visitor = Visitor.create(cookie_id: cookies.permanent[:visitor_id])
      session[:visitor_id] = @current_visitor.id
    end
    @current_visitor
  end
  helper_method :current_visitor

  def update_visit_count
    # Checking whether the referral is coming from elsewhere in the same site, which in this case has a URL including 'slothbook'
    unless ( request.referer && request.referer.include?("slothbook") )
      @current_visitor.update(visit_count: @current_visitor.visit_count + 1)
    end
  end

  def update_pageview_count
    @current_visitor.update(pageview_count: @current_visitor.pageview_count + 1)
  end
  
end
