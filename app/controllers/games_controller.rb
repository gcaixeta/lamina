class GamesController < ApplicationController

before_filter :login_required, :only => [ :new, :create, :update, :destroy, :show, :edit, :index ]

before_filter :is_teacher, :only => [:new, :create, :update, :destroy, :edit]

  before_filter :find_theme
  # GET /games
  # GET /games.xml
  def index
    @games = Game.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @games.to_xml }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @game.to_xml }
    end
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1;edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.xml
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if  @theme.games << @game

        flash[:notice] = 'Game was successfully created.'
        format.html { redirect_to theme_games_url }
        format.xml  { head :created, :location => game_url(@game) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game.errors.to_xml }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        flash[:notice] = 'Game was successfully updated.'
        format.html { redirect_to game_url(@game) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @game.errors.to_xml }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.xml
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.xml  { head :ok }
    end
  end

  private
  def find_theme
    @theme = Theme.find params[:theme_id]
  end

 def is_teacher
                reg = Registration.find_by_user_id_and_profile_id(session[:user], 2)
                if reg == nil
                    flash[:notice] = "Voce não tem permissao para cadastrar um tema"
                  redirect_to themes_path
                    #render :action => 'index'
                end
        end
end
