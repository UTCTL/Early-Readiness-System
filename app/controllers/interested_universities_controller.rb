class InterestedUniversitiesController < ApplicationController
  # GET /interested_universities
  # GET /interested_universities.json
  def index
    @interested_universities = InterestedUniversity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @interested_universities }
    end
  end

  # GET /interested_universities/1
  # GET /interested_universities/1.json
  def show
    @interested_university = InterestedUniversity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @interested_university }
    end
  end

  # GET /interested_universities/new
  # GET /interested_universities/new.json
  def new
    @interested_university = InterestedUniversity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interested_university }
    end
  end

  # GET /interested_universities/1/edit
  def edit
    @interested_university = InterestedUniversity.find(params[:id])
  end

  # POST /interested_universities
  # POST /interested_universities.json
  def create
    @interested_university = InterestedUniversity.new(params[:interested_university])

    respond_to do |format|
      if @interested_university.save
        format.html { redirect_to @interested_university, notice: 'Interested university was successfully created.' }
        format.json { render json: @interested_university, status: :created, location: @interested_university }
      else
        format.html { render action: "new" }
        format.json { render json: @interested_university.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /interested_universities/1
  # PUT /interested_universities/1.json
  def update
    @interested_university = InterestedUniversity.find(params[:id])

    respond_to do |format|
      if @interested_university.update_attributes(params[:interested_university])
        format.html { redirect_to @interested_university, notice: 'Interested university was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @interested_university.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interested_universities/1
  # DELETE /interested_universities/1.json
  def destroy
    @interested_university = InterestedUniversity.find(params[:id])
    @interested_university.destroy

    respond_to do |format|
      format.html { redirect_to interested_universities_url }
      format.json { head :ok }
    end
  end
end
