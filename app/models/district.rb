class District < ActiveRecord::Base
	has_many :highschools
	has_many :admin_users
	has_many :students, :through => :highschools
end
