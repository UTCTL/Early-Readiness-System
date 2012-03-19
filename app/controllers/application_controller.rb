class ApplicationController < ActionController::Base
  protect_from_forgery

  def authorize
  	redirect_to login_url, alert: "Not authorized" if session[:eid].nil?
  end

  def logged_in
  	if !session[:eid].nil?
  		return true
  	else
  		return false
  	end
  end
  helper_method :logged_in

end
