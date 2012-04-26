class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  load_and_authorize_resource
  before_filter :authorize


  def index





    if AdminUser.find_by_eid(session[:eid])
      @user =  AdminUser.find_by_eid(session[:eid])
    elsif Student.find_by_eid(session[:eid]) 
      logged_in = Student.find_by_eid(session[:eid])
      redirect_to(logged_in, :notice => 'Welcome back, ' + logged_in.name.titlecase + '!')
      return
    end
    

    @accessible_students = Student

    if can? :manage, Student
      if @user.role == 'Highschool'
        @accessible_students = @user.highschool.students
      elsif @user.role == 'District'
        @accessible_students = @user.district.students
      elsif @user.role == 'University'
        @accessible_students = @user.university.students
      end
    end


#     params[:search].compact
     
#    if params[:search]  
#      if params[:search][:highschool_id_in]
#          params[:search][:highschool_id_in] = params[:search][:highschool_id_in].compact
#      end
#    end


      @search = @accessible_students.search(params[:search])       
      @results = @search.group(:eid)
      @results = @results.all(:order => 'highschool_id, name')

      @registered = @accessible_students

      @students = @results

      #params[:search] = params[:search].clear
   
    

    @needs_scores = @accessible_students.needs_scores
    @has_scores = @accessible_students.has_scores
    @accepted = @accessible_students.accepted
    @universities = University.all
    @subjects = Subject.all
    @districts = District.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])
    if(@student.gender_id)
      @gender = Gender.find(@student.gender_id)
    end
    @scores = @student.scores
    @subjects = Subject.all
    @exams = @student.exams.sort_by{|e| e[:subject_id]}
    @question_responses = @student.question_responses
    @universities = University.all
   

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
 

    if Student.find_by_eid(session[:eid]) 
      logged_in = Student.find_by_eid(session[:eid])
      redirect_to(logged_in, :notice => 'Welcome back, ' + logged_in.name.titlecase + '!')
      return
    end

    @student=Student.new
    @exams = Exam.all
    @highschools = Highschool.all
    @questions = Question.all
    @subjects = Subject.all
    @universities = University.all
    @genders = Gender.all


    @questions.each do |q|
        @student.question_responses.build(:question_id => q.id)  
    end

    username = 'uid=4795ftfx,ou=services,dc=entdir,dc=utexas,dc=edu'
    password = "n)yexbpw@n7og*ic!o@:5gz0@56qu%+q6:g94"
    host = 'entdir.utexas.edu'
    ldap = Net::LDAP.new :host => host, :port => 636, :encryption => :simple_tls
    ldap.auth username, password


    filter = Net::LDAP::Filter.eq("utexasEduPersonEid", session[:eid])

    treebase = "dc=entdir,dc=utexas,dc=edu"

    ldap.search(:base => treebase, :filter => filter) do |entry|
         if AdminUser.find_by_eid(session[:eid]) 
            eid = 'sae102'
          else
            eid = session[:eid]
        end
      
      name = entry.cn[0].upcase
      address = entry.homePostalAddress[0].split('$')
      address1 = address[0]
      if address.length>2
        address2=address[1]
        citystatezip=address[2]
      else
        address2=''
        citystatezip=address[1]
      end
      city=citystatezip.split(', ')[0]
      state=citystatezip.split(', ')[1].split(' ')[0]
      zip=citystatezip.split(', ')[1].split(' ')[1]
      fullPhone = entry.homePhone[0].split
      phone=fullPhone[1]+"-"+fullPhone[2]+"-"+fullPhone[3]
      birthday=Date.strptime(entry.utexasEduPersonBirthDate[0], '%Y%m%d')
      email=entry.mail[0].upcase
      @student.eid = eid
      @student.name=name
      @student.address1=address1
      @student.address2=address2
      @student.city=city
      @student.state=state
      @student.zip=zip
      @student.residency=state
      @student.email=email
      #@student.phone=phone
      @student.birthday=birthday
    end
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
    @exams = Exam.all
    @sections = Section.all
    @highschools = Highschool.all
    @questions = Question.all
    @subjects = Subject.all
    @genders = Gender.all
    @universities = University.all

    end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])


    @subjects = Subject.all
    @exams = Exam.all
    @highschools = Highschool.all
    @sections = Section.all
    @questions = Question.all
    @genders = Gender.all
    @universities = University.all
  
 



    respond_to do |format|
    @highschool_name = params[:student][:highschool_name]

    if Highschool.find_by_name(@highschool_name)
      @the_highschool = Highschool.find_by_name(@highschool_name)
      @student.highschool = @the_highschool
    else 
      @newschool = @student.build_highschool(:name => @highschool_name)
      @student.highschool = @newschool
      @newschool.district = District.find(1)
     end
      if @student.save
        format.html { redirect_to @student, notice: 'You have successfully registered.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])
    @subjects = Subject.all
    @questions = Question.all
    @highschools = Highschool.all
    @genders = Gender.all
    @universities = University.all

    respond_to do |format|
  @highschool_name = params[:student][:highschool_name]
   if Highschool.find_by_name(@highschool_name)
      @the_highschool = Highschool.find_by_name(@highschool_name)
      @student.highschool = @the_highschool
    else 
      @newschool = @student.build_highschool(:name => @highschool_name)
      @student.highschool = @newschool
     end
  if @student.update_attributes(params[:student])
  
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :ok }
    end
  end
end
