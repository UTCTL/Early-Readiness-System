class ExamSubjectsController < ApplicationController
  # GET /exam_subjects
  # GET /exam_subjects.json
  def index
    @exam_subjects = ExamSubject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exam_subjects }
    end
  end

  # GET /exam_subjects/1
  # GET /exam_subjects/1.json
  def show
    @exam_subject = ExamSubject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam_subject }
    end
  end

  # GET /exam_subjects/new
  # GET /exam_subjects/new.json
  def new
    @exam_subject = ExamSubject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam_subject }
    end
  end

  # GET /exam_subjects/1/edit
  def edit
    @exam_subject = ExamSubject.find(params[:id])
  end

  # POST /exam_subjects
  # POST /exam_subjects.json
  def create
    @exam_subject = ExamSubject.new(params[:exam_subject])

    respond_to do |format|
      if @exam_subject.save
        format.html { redirect_to @exam_subject, notice: 'Exam subject was successfully created.' }
        format.json { render json: @exam_subject, status: :created, location: @exam_subject }
      else
        format.html { render action: "new" }
        format.json { render json: @exam_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exam_subjects/1
  # PUT /exam_subjects/1.json
  def update
    @exam_subject = ExamSubject.find(params[:id])

    respond_to do |format|
      if @exam_subject.update_attributes(params[:exam_subject])
        format.html { redirect_to @exam_subject, notice: 'Exam subject was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_subjects/1
  # DELETE /exam_subjects/1.json
  def destroy
    @exam_subject = ExamSubject.find(params[:id])
    @exam_subject.destroy

    respond_to do |format|
      format.html { redirect_to exam_subjects_url }
      format.json { head :ok }
    end
  end
end
