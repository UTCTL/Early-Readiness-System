class ExamsController < ApplicationController
  load_and_authorize_resource
  before_filter :authorize
  
  # GET /exams
  # GET /exams.json
  def index
    @exams = Exam.all
    @subjects = Subject.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exams }
    end
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
    @exam = Exam.find(params[:id])
    @subject = @exam.subject
    @subtopic = @exam.subtopic
    @students = @exam.students
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam }
    end
  end

  # GET /exams/new
  # GET /exams/new.json
  def new
    @exam = Exam.new
    @subjects = Subject.all
    @subtopics = Subtopic.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam }
    end
  end

  # GET /exams/1/edit
  def edit
    @exam = Exam.find(params[:id])
    @subjects = Subject.all
    @subtopics = Subtopic.all
  end

  # POST /exams
  # POST /exams.json
  def create
    @exam = Exam.new(params[:exam])
    @subjects = Subject.all    
    @subtopics = Subtopic.all
    respond_to do |format|
      if @exam.save
        format.html { redirect_to @exam, notice: 'Exam was successfully created.' }
        format.json { render json: @exam, status: :created, location: @exam }
      else
        format.html { render action: "new" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exams/1
  # PUT /exams/1.json
  def update
    @exam = Exam.find(params[:id])
    @subjects = Subject.all
    @subtopics = Subtopic.all
    respond_to do |format|
      if @exam.update_attributes(params[:exam])
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy

    respond_to do |format|
      format.html { redirect_to exams_url }
      format.json { head :ok }
    end
  end
end
