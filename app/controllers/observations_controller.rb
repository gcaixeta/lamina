class ObservationsController < ApplicationController
before_filter :find_activity
  # GET /observations
  # GET /observations.xml
  def index
    @observations = Observation.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @observations.to_xml }
    end
  end

  # GET /observations/1
  # GET /observations/1.xml
  def show
    @observation = Observation.find(params[:id])
@activity = Activity.find params[:activity_id]
    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @observation.to_xml }
      format.js
    end
  end

  # GET /observations/new
  def new
   @observation = Observation.new
   @activity = Activity.find params[:activity_id]

  end

  # GET /observations/1;edit
  def edit
    @activity = Activity.find params[:activity_id]
    @observation = Observation.find(params[:id])
  end

  # POST /observations
  # POST /observations.xml



  def create
      @activity = Activity.find params[:activity_id]
              
     @observation = Observation.new(params[:observation])
     @observation.activity_id = @activity.id
     
    respond_to do |format|
      if @observation.activity
        @observation.save
        flash[:notice] = 'Observation was successfully created.'
        format.html { redirect_to observation_url(@observation) }
        format.xml  { head :created, :location => observation_url(@observation) }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @observation.errors.to_xml }
      end
    end
  end

  # PUT /observations/1
  # PUT /observations/1.xml
  def update
    @observation = Observation.find(params[:id])
    @activity = Activity.find params[:activity_id]
    respond_to do |format|
      if @observation.update_attributes(params[:observation])
        flash[:notice] = 'Observation was successfully updated.'
        format.html { redirect_to observation_url(@observation) }
        format.xml  { head :ok }
        format.js
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @observation.errors.to_xml }
      end
    end
  end

  # DELETE /observations/1
  # DELETE /observations/1.xml
  def destroy
    @observation = Observation.find(params[:id])
    @observation.destroy

    respond_to do |format|
      format.html { redirect_to observations_url }
      format.xml  { head :ok }
    end
  end
private
  def find_activity
    @activity = Activity.find params[:activity_id]
  end
end
