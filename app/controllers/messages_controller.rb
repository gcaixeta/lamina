class MessagesController < ApplicationController

before_filter :find_group

  # GET /messages
  # GET /messages.xml
  def index
    @messages = Message.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @messages.to_xml }
    end
  end

  # GET /messages/1
  # GET /messages/1.xml
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @message.to_xml }
    end
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1;edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.xml
  def create
    registration = @group.registrations.find_by_user_id(session[:user])
    
    participation = Participation.find_by_group_id_and_registration_id(@group.id,registration.id)

    @message = Message.new(params[:message])
     @message.participation_id = participation.id
    respond_to do |format|
      if @message.save
        flash[:notice] = 'Message was successfully created.'
        format.html { redirect_to message_url(@message) }
        format.xml  { head :created, :location => message_url(@message) }
        format.js { }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors.to_xml }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.xml
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        flash[:notice] = 'Message was successfully updated.'
        format.html { redirect_to message_url(@message) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message.errors.to_xml }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.xml  { head :ok }
    end
  end
  
    private
  def find_group
    @group = Group.find params[:group_id]
  end
end
