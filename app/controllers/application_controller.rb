class ApplicationController < ActionController::Base
  protect_from_forgery
  #load_and_authorize_resource
  #skip_before_filter :verify_authenticity_token
 
  def authorize
  	redirect_to(login_url, :error => 'You must log in to continue') if session[:eid].nil?
  end

  def logged_in
  	if session[:eid].nil?
  		return false
  	else
  		return true
  	end
  end
  helper_method :logged_in


  def current_user
    if (session[:eid])
      session[:eid]
    else
      #nil
      session[:eid] = 'lnd322' #comment out later
    end
  end

rescue_from CanCan::AccessDenied do |exception|
  redirect_to(root_url, :error => 'Access Denied!')
end

end
