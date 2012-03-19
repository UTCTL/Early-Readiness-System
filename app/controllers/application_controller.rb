class ApplicationController < ActionController::Base
  protect_from_forgery

  def authorize
  	redirect_to login_url, alert: "Not authorized" if session[:eid].nil?
  end

end
