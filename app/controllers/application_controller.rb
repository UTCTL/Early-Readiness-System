class ApplicationController < ActionController::Base
  protect_from_forgery

  def authorize
  	redirect_to login_url, notice: "Please login to continue" if session[:eid].nil?
  end

  def logged_in
  	if !session[:eid].nil?
  		return true
  	else
  		return false
  	end
  end
  helper_method :logged_in

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access Denied"
    redirect_to root_url
  end

end
