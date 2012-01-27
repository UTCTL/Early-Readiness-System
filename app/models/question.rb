class Question < ActiveRecord::Base
  belongs_to :section
  has_many :question_option
  validates :text, :section_id, :presence => true
end