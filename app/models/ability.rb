class Ability
	include CanCan::Ability

 def initialize(user)
    
    if AdminUser.find_by_eid(user) #user is an admin
      
      admin = AdminUser.find_by_eid(user)

      if admin.role == 'SuperAdmin'
      	can :manage, :all
      elsif #not a super admin
      	can :manage, Student
   	  end      
    elsif Student.find_by_eid(user) #logged in as student
      can :read, Student, :eid => user
      can :create, Student
      can :manage, Student, :eid => user
    else
    	can :create, Student
    end
  end


end