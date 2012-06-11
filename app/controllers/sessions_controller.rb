class SessionsController < ApplicationController
  def index
  end

  def create    
  	eid=params[:username]
    user_pass=params[:password]
  	username = 'uid=4795ftfx,ou=services,dc=entdir,dc=utexas,dc=edu'
    password = "n)yexbpw@n7og*ic!o@:5gz0@56qu%+q6:g94"
    host = 'entdir.utexas.edu'
    ldap = Net::LDAP.new :host => host, :port => 636, :encryption => :simple_tls
    ldap.auth username, password

    filter = Net::LDAP::Filter.eq("utexasEduPersonEid", eid)
    treebase = "dc=entdir,dc=utexas,dc=edu"

    ldap.search(:base => treebase, :filter => filter) do |entry|
      @dn=entry.dn
    end

    ldap.auth @dn, user_pass
    if ldap.bind
      session[:eid] = eid

      if AdminUser.find_by_eid(session[:eid])
        @user =  AdminUser.find_by_eid(session[:eid])
        redirect_to(students_url, :notice => 'Welcome back, ' + @user.name.titlecase + '!')
      else
        redirect_to '/register', notice: 'Logged in'
      end
    else
      flash.now.alert = "Username or password is invalid."
      render :action => 'new'
    end
    rescue Net::LDAP::LdapError => e
      flash.now.alert = "Username or password is invalid."
      render :action => 'new'
  end

def destroy
  session[:eid] = nil
  redirect_to root_url, notice: "Logged out!"
end

end
