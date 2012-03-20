class Subject < ActiveRecord::Base
	has_many :exams
	has_many :subtopics
end
