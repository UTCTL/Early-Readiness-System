class QuestionResponse < ActiveRecord::Base
  belongs_to :student
  belongs_to :question
  validates :question, :presence => true
end
