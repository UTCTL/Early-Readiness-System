class ApplicationController < ActionController::Base
  protect_from_forgery
  #load_and_authorize_resource
 
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


  def current_user
    if (session[:eid])
      session[:eid]
    else
      nil
    end
  end

rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied!"
  redirect_to root_url
end

end
