class RegisterController < ApplicationController
  def index
  	@student = Student.new
  end

end
