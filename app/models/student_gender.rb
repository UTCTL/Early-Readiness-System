class StudentGender < ActiveRecord::Base
  belongs_to :students
  belongs_to :genders
end
