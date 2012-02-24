class Section < ActiveRecord::Base
	validates :title, :description, :error, :presence => true
	has_many :questions
	accepts_nested_attributes_for :questions
end
