class PagesController < ApplicationController
	def index
	respond_to do |format|
    	format.html # index.html.erb
    end
  end

    def success
	respond_to do |format|
    	format.html # index.html.erb
    end
  end
  
end