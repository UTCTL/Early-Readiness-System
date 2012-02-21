class StudentScore < ActiveRecord::Base
	 validates :exam_id, :student_id, :student_score, :presence => true
	belongs_to :student
	has_one :exam
end
