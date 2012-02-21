class StudentScoresController < ApplicationController
  # GET /student_scores
  # GET /student_scores.json
  def index
    @student_scores = StudentScore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_scores }
    end
  end

  # GET /student_scores/1
  # GET /student_scores/1.json
  def show
    @student_score = StudentScore.find(params[:id])
    @student_name = Student.find(StudentScore.find(params[:id]).student_id).name
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_score }
    end
  end

  # GET /student_scores/new
  # GET /student_scores/new.json
  def new
    @student_score = StudentScore.new
    @exams = Exam.all
    @students = Student.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_score }
    end
  end

  # GET /student_scores/1/edit
  def edit
    @student_score = StudentScore.find(params[:id])
    @exams = Exam.all
    @students = Student.all

  end

  # POST /student_scores
  # POST /student_scores.json
  def create
    @student_score = StudentScore.new(params[:student_score])
    @exams = Exam.all
    @students = Student.all

    respond_to do |format|
      if @student_score.save
        format.html { redirect_to @student_score, notice: 'Student score was successfully created.' }
        format.json { render json: @student_score, status: :created, location: @student_score }
      else
        format.html { render action: "new" }
        format.json { render json: @student_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_scores/1
  # PUT /student_scores/1.json
  def update
    @student_score = StudentScore.find(params[:id])

    respond_to do |format|
      if @student_score.update_attributes(params[:student_score])
        format.html { redirect_to @student_score, notice: 'Student score was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_scores/1
  # DELETE /student_scores/1.json
  def destroy
    @student_score = StudentScore.find(params[:id])
    @student_score.destroy

    respond_to do |format|
      format.html { redirect_to student_scores_url }
      format.json { head :ok }
    end
  end
end
