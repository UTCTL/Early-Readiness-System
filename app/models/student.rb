

class Student < ActiveRecord::Base
	validates :name, :address1, :city, :state, :zip, :residency, :email, :birthday, :highschool, :presence => true
	has_many :question_options

end

