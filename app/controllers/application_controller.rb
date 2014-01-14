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
    elsif Visitor.find_by(remote_ip: request.remote_ip)
      @current_visitor = Visitor.find_by(remote_ip: request.remote_ip)
      session[:visitor_id] = @current_visitor.id
    else
      @current_visitor = Visitor.create(remote_ip: request.remote_ip)
      session[:visitor_id] = @current_visitor.id
    end
    @current_visitor
  end
  helper_method :current_visitor

  def update_visit_count
    unless request.referer && request.referer.include?("sloth-book")
      @current_visitor.update(visit_count: @current_visitor.visit_count + 1)
    end
  end

  def update_pageview_count
    @current_visitor.update(pageview_count: @current_visitor.pageview_count + 1)
  end
  
end
