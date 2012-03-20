class StudentGendersController < ApplicationController
  # GET /student_genders
  # GET /student_genders.json
  def index
    @student_genders = StudentGender.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_genders }
    end
  end

  # GET /student_genders/1
  # GET /student_genders/1.json
  def show
    @student_gender = StudentGender.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_gender }
    end
  end

  # GET /student_genders/new
  # GET /student_genders/new.json
  def new
    @student_gender = StudentGender.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_gender }
    end
  end

  # GET /student_genders/1/edit
  def edit
    @student_gender = StudentGender.find(params[:id])
  end

  # POST /student_genders
  # POST /student_genders.json
  def create
    @student_gender = StudentGender.new(params[:student_gender])

    respond_to do |format|
      if @student_gender.save
        format.html { redirect_to @student_gender, notice: 'Student gender was successfully created.' }
        format.json { render json: @student_gender, status: :created, location: @student_gender }
      else
        format.html { render action: "new" }
        format.json { render json: @student_gender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_genders/1
  # PUT /student_genders/1.json
  def update
    @student_gender = StudentGender.find(params[:id])

    respond_to do |format|
      if @student_gender.update_attributes(params[:student_gender])
        format.html { redirect_to @student_gender, notice: 'Student gender was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_gender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_genders/1
  # DELETE /student_genders/1.json
  def destroy
    @student_gender = StudentGender.find(params[:id])
    @student_gender.destroy

    respond_to do |format|
      format.html { redirect_to student_genders_url }
      format.json { head :ok }
    end
  end
end
