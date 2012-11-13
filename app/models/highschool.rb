class Highschool < ActiveRecord::Base
	validates :name, :address1, :city, :district, :state, :zipcode, :presence => true
 
  belongs_to :district, :autosave => true
  has_many :students
  has_many :admin_users

   accepts_nested_attributes_for :district
end
