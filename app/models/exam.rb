class Exam < ActiveRecord::Base
  validates :name, :subject_id, :required_score, :presence => true
  validates_numericality_of :required_score, :only_integer => true, :message => "Score must be a whole number."
  belongs_to :subject
end
