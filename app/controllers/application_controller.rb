class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user



  def find_current_visitor
    @current_visitor ||= if session[:visitor_id]
      Visitor.find(session[:visitor_id])
    else
      visitor = Visitor.create(remote_ip: request.remote_ip)
      session[:visitor_id] = visitor.id
      visitor
    end
  end
  helper_method :current_visitor

end
