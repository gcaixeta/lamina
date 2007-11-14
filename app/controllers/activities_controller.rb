class ActivitiesController < ApplicationController
before_filter :find_group
before_filter :is_teacher, :only => [:index, :new, :show, :create, :update, :destroy, :edit, :approved]



  def index
   participations = Participation.find_all_by_group_id(@group.id)
    @activity = Activity.find_by_participation_id(participations)

    @observations = Observation.find_all_by_activity_id(@activity)


      @activities = Activity.find(:all, :conditions => [ "participation_id IN (?) AND creation_type = 'Question'",participations])
    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @activities.to_xml }
      format.js
    end
  end
  
  def approved
  @activity = Activity.find(params[:id])
  @activity.approved = 1
  @activity.save
      respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @activity.to_xml }
      format.js
    end
  end

  # GET /activities/1
  # GET /activities/1.xml
  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @activity.to_xml }
    end
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1;edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # POST /activities
  # POST /activities.xml
  def create
    @activity = Activity.new(params[:activity])

    respond_to do |format|
      if @activity.save
        flash[:notice] = 'Activity was successfully created.'
        format.html { redirect_to activity_url(@activity) }
        format.xml  { head :created, :location => activity_url(@activity) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @activity.errors.to_xml }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.xml
  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        flash[:notice] = 'Activity was successfully updated.'
        format.html { redirect_to activity_url(@activity) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activity.errors.to_xml }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.xml
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url }
      format.xml  { head :ok }
    end
  end
      private
  def find_group
    @group = Group.find params[:group_id]
  end
        def is_teacher
                reg = Registration.find_by_user_id_and_profile_id(session[:user], 2)
                if reg == nil
                    flash[:notice] = "Voce nao tem permissao para acessar"
                  redirect_to groups_path
                    #render :action => 'index'
                end
        end
end
