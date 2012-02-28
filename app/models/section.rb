class Section < ActiveRecord::Base
	validates :title, :description, :error, :presence => true
	has_many :questions
	has_many :universities
	accepts_nested_attributes_for :questions
	accepts_nested_attributes_for :universities
end
