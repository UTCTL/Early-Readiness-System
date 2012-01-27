class QuestionOption < ActiveRecord::Base
  validates :text, :presence => true
  belongs_to :question
end