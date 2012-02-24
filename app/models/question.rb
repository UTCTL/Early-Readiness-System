class Question < ActiveRecord::Base
  belongs_to :section
  has_many :question_option
  validates :text, :section_id, :presence => true
  has_many :question_responses
  accepts_nested_attributes_for :question_responses
end