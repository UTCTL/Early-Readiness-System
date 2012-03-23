class AdminUser < ActiveRecord::Base

 def self.role?(role)
  roles.include? role.to_s
 end

end
