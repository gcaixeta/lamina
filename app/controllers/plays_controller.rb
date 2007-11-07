class PlaysController < ApplicationController

#ANOTACOES
#1 passo
#usuario passa pergunta do grupo deleend

  def index
    @plays = Play.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @plays.to_xml }
    end
  end

  # GET /plays/1
  # GET /plays/1.xml
  def show
    @play = Play.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @play.to_xml }
    end
  end
  
  def list
  	play = params[:play].to_i
  	
  	@group = Group.find(params[:group_id])
  	@players = @grou.players
  	
  	
  	
  	if play == 0
  	#localiza todas as jogadas direcionadas ao grupo do individuo
  		@plays = Play.find(:all)
  	end
  	
  end

  # GET /plays/new
  def new
    @play = Play.new
  end

  # GET /plays/1;edit
  def edit
    @play = Play.find(params[:id])
  end

  # POST /plays
  # POST /plays.xml
  def create
    @play = Play.new(params[:play])

    respond_to do |format|
      if @play.save
        flash[:notice] = 'Play was successfully created.'
        format.html { redirect_to play_url(@play) }
        format.xml  { head :created, :location => play_url(@play) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @play.errors.to_xml }
      end
    end
  end

  # PUT /plays/1
  # PUT /plays/1.xml
  def update
    @play = Play.find(params[:id])

    respond_to do |format|
      if @play.update_attributes(params[:play])
        flash[:notice] = 'Play was successfully updated.'
        format.html { redirect_to play_url(@play) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @play.errors.to_xml }
      end
    end
  end

  # DELETE /plays/1
  # DELETE /plays/1.xml
  def destroy
    @play = Play.find(params[:id])
    @play.destroy

    respond_to do |format|
      format.html { redirect_to plays_url }
      format.xml  { head :ok }
    end
  end
end
