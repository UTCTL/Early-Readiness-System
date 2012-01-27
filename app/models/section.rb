class Section < ActiveRecord::Base
	validates :title, :description, :error, :presence => true
	has_many :question
end
