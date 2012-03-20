class University < ActiveRecord::Base

	has_many :interested_universities
	has_many :students, :through => :interested_universities

	belongs_to :section

	accepts_nested_attributes_for :section
	accepts_nested_attributes_for :students

	scope :ut, where(:shortname => 'ut')
	scope :a_m, where(:shortname => 'a_m')
end
