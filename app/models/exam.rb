class Exam < ActiveRecord::Base
  validates :name, :subject_id, :required_score, :presence => true
  validates_numericality_of :required_score, :only_integer => true, :message => "Score must be a whole number."
  belongs_to :subject
  belongs_to :subtopic
  has_many :scores
  has_many :students, :through => :scores

  scope :pending_score, joins(:scores).merge(Score.score_pending)
  scope :has_score, joins(:scores).merge(Score.score_present)

end
