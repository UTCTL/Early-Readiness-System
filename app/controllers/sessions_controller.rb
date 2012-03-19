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
      redirect_to '/register', notice: 'Logged in'
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
  redirect_to new_student_path, notice: "Logged out!"
end

end
