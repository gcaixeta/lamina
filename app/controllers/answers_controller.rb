class AnswersController < ApplicationController

  before_filter :find_group
  
  def index
    @answers = Answer.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @answers.to_xml }
    end
  end

  # GET /answers/1
  # GET /answers/1.xml
  def show
    @answer = Answer.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @answer.to_xml }
    end
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1;edit
  def edit
    @answer = Answer.find(params[:id])
  end

  # POST /answers
  # POST /answers.xml
  def create
    @answer = Answer.new(params[:answer])

    respond_to do |format|
      if @answer.save
        registration = @group.registrations.find_by_user_id(session[:user])
        participation = Participation.find_by_group_id_and_registration_id(@group.id,registration.id)
        activity = participation.activities.create(:creation => @answer)
        interaction = Interaction.create(:activity_id => activity.id, :participation_id => participation.id, :action_type => 'newA' )
      
        flash[:notice] = 'Answer was successfully created.'
        format.html { redirect_to group_answer_url(@group, @answer) }
        format.xml  { head :created, :location => group_answer_url(@group, @answer) }
        format.js 
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @answer.errors.to_xml }
        format.js 
      end
    end
  end

  # PUT /answers/1
  # PUT /answers/1.xml
  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        flash[:notice] = 'Answer was successfully updated.'
        format.html { redirect_to answer_url(@answer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @answer.errors.to_xml }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.xml
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url }
      format.xml  { head :ok }
    end
  end
private
  def find_group
    @group = Group.find params[:group_id]
  end
end
