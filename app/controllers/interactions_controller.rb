class InteractionsController < ApplicationController

before_filter :find_group

  def index
    #
    # questoes = Activity.find(:all, :conditions => [ "participation_id IN (?) AND creation_type = 'Question'",participations])
#Group.find(5).participation_ids
#questoes.first.creation
# :order => "created_on DESC"
    participations = Participation.find_all_by_group_id(@group.id)
    interaction = params[:interaction]
    
    if interaction == 0
      activities = Activity.find(:all, :conditions => [ "participation_id IN (?) AND creation_type = 'Question'",participations])
    
    elsif interaction > 0
    
    else
      @interactions = Interaction.find(:all)
    end
    
    
    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @interactions.to_xml }
      format.js
    end
  end

  # GET /interactions/1
  # GET /interactions/1.xml
  def show
    @interaction = Interaction.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @interaction.to_xml }
    end
  end

  # GET /interactions/new
  def new
    @interaction = Interaction.new
  end

  # GET /interactions/1;edit
  def edit
    @interaction = Interaction.find(params[:id])
  end

  # POST /interactions
  # POST /interactions.xml
  def create
    @interaction = Interaction.new(params[:interaction])

    respond_to do |format|
      if @interaction.save
        flash[:notice] = 'Interaction was successfully created.'
        format.html { redirect_to interaction_url(@interaction) }
        format.xml  { head :created, :location => interaction_url(@interaction) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @interaction.errors.to_xml }
      end
    end
  end

  # PUT /interactions/1
  # PUT /interactions/1.xml
  def update
    @interaction = Interaction.find(params[:id])

    respond_to do |format|
      if @interaction.update_attributes(params[:interaction])
        flash[:notice] = 'Interaction was successfully updated.'
        format.html { redirect_to interaction_url(@interaction) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @interaction.errors.to_xml }
      end
    end
  end

  # DELETE /interactions/1
  # DELETE /interactions/1.xml
  def destroy
    @interaction = Interaction.find(params[:id])
    @interaction.destroy

    respond_to do |format|
      format.html { redirect_to interactions_url }
      format.xml  { head :ok }
    end
  end
private
  def find_group
    @group = Group.find params[:group_id]
  end
end
