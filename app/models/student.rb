

class Student < ActiveRecord::Base
	validates :name, :address1, :city, :state, :zip, :residency, :email, :birthday, :highschool, :presence => true

	has_many :scores
	has_many :exams, :through => :scores
	

	has_many :question_responses
	has_many :questions, :through => :question_responses


	accepts_nested_attributes_for :question_responses, :questions

end



