class Score < ActiveRecord::Base
  validates :student_id, :exam_id, :presence => true
  belongs_to :student
  belongs_to :exam

  scope :score_present, where("scores.student_score IS NOT NULL")
  scope :score_pending, where("scores.student_score IS NULL")
end
