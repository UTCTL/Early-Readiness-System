class HighschoolsController < ApplicationController
  # GET /highschools
  # GET /highschools.json
  def index
    @highschools = Highschool.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @highschools }
    end
  end

  # GET /highschools/1
  # GET /highschools/1.json
  def show
    @highschool = Highschool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @highschool }
    end
  end

  # GET /highschools/new
  # GET /highschools/new.json
  def new
    @highschool = Highschool.new



    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @highschool }
    end
  end

  # GET /highschools/1/edit
  def edit
    @highschool = Highschool.find(params[:id])
  end

  # POST /highschools
  # POST /highschools.json
  def create
       @highschool = Highschool.new(:name => params[:highschool][:name])
      @district_name = params[:highschool][:district]
   if District.find_by_name(@district_name)
      params[:highschool][:district] = District.find_by_name(@district_name)
    else 
     params[:highschool][:district] = @highschool.build_district(:name => @district_name)
     end
   

   

    respond_to do |format|
      if @highschool.save
        format.html { redirect_to @highschool, notice: 'Highschool was successfully created.' }
        format.json { render json: @highschool, status: :created, location: @highschool }
      else
        format.html { render action: "new" }
        format.json { render json: @highschool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /highschools/1
  # PUT /highschools/1.json
  def update
    @highschool = Highschool.find(params[:id])

    respond_to do |format|
           @district_name = params[:highschool][:district]
   if District.find_by_name(@district_name)
      params[:highschool][:district] = District.find_by_name(@district_name)
    else 
     params[:highschool][:district] = @highschool.build_district(:name => @district_name)
    end

      if @highschool.update_attributes(params[:highschool])
        format.html { redirect_to @highschool, notice: 'Highschool was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @highschool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /highschools/1
  # DELETE /highschools/1.json
  def destroy
    @highschool = Highschool.find(params[:id])
    @highschool.destroy

    respond_to do |format|
      format.html { redirect_to highschools_url }
      format.json { head :ok }
    end
  end
end
