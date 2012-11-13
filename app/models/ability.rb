class Ability
	include CanCan::Ability

 def initialize(user)
    
    if AdminUser.find_by_eid(user) #user is an admin
      
      admin = AdminUser.find_by_eid(user)

      if admin.role == 'SuperAdmin'
      	can :manage, :all
      elsif admin.role == 'Highschool' #not a super admin
      	can :manage, Student, :highschool_id => admin.highschool_id
        can :read, Student, :highschool_id => admin.highschool_id
      elsif admin.role == 'District'
        can :manage, Student, :highschool => {:district_id => admin.district_id}
        can :read, Student, :highschool => {:district_id => admin.district_id}
      elsif admin.role == 'University'
        can :manage, Student, :universities => {:id => admin.university_id}
        can :read, Student, :universities => {:id => admin.university_id}
        end      
    elsif Student.find_by_eid(user) #logged in as student
      can :read, Student, :eid => user
      #can :create, Student, :eid => user
      can :manage, Student, :eid => user
    else
    	can :create, Student
    end
  end


end