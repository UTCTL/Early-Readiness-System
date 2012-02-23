

class Student < ActiveRecord::Base
	validates :name, :address1, :city, :state, :zip, :residency, :email, :birthday, :highschool, :presence => true
	has_many :scores
	has_many :exams, :through => :scores

end

