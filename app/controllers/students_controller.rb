class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])
    @scores = @student.scores
    @exams = @student.exams.sort_by{|e| e[:subject_id]}
    @question_responses = @student.question_responses
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student=Student.new
    @exams = Exam.all
    @sections = Section.all
    @questions = Question.all
    @questions.each do |q|
        @student.question_responses.build(:question_id => q.id)  
    end

    username = 'uid=4795ftfx,ou=services,dc=entdir,dc=utexas,dc=edu'
    password = "n)yexbpw@n7og*ic!o@:5gz0@56qu%+q6:g94"
    host = 'entdir.utexas.edu'
    ldap = Net::LDAP.new :host => host,  :port => 636, :encryption => :simple_tls
    ldap.auth username, password

    filter = Net::LDAP::Filter.eq( "utexasEduPersonEid", "lhorton" )
    treebase = "dc=entdir,dc=utexas,dc=edu"

    ldap.search( :base => treebase, :filter => filter ) do |entry|
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
         birthday=Date.strptime(entry.utexasEduPersonBirthDate[0],'%Y%m%d')
         email=entry.mail[0].upcase
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
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])
    @exams = Exam.all
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
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
    @exams = Exam.all
    respond_to do |format|
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
