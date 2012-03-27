class Highschool < ActiveRecord::Base
  belongs_to :district
  has_many :students
  has_many :admin_users
end
