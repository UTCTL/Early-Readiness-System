class AdminUser < ActiveRecord::Base

belongs_to :university
belongs_to :highschool
belongs_to :district

 def self.role?(role)
  roles.include? role.to_s
 end

end
