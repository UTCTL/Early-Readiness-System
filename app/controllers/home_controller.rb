class HomeController < ApplicationController
  def index
  end

  def login
  	@username=params[:username]
  	username = 'uid=4795ftfx,ou=services,dc=entdir,dc=utexas,dc=edu'
    password = "n)yexbpw@n7og*ic!o@:5gz0@56qu%+q6:g94"
    host = 'entdir.utexas.edu'
    ldap = Net::LDAP.new :host => host, :port => 636, :encryption => :simple_tls
    ldap.auth username, password

    filter = Net::LDAP::Filter.eq("utexasEduPersonEid", @username)
    treebase = "dc=entdir,dc=utexas,dc=edu"

    ldap.search(:base => treebase, :filter => filter) do |entry|
    	@dn=entry.dn
    end
  	respond_to do |format|
      format.html # login.html.erb
    end
  end

end
