class GamesController < ApplicationController

  before_filter :login_required, :only => [ :new, :create, :update, :destroy, :show, :edit, :index ]

  before_filter :is_teacher, :only => [:new, :create, :update, :destroy, :edit]

  before_filter :find_theme, :except => [:play]
  before_filter :find_group, :only => [:play]
  # GET /games
  # GET /games.xml
  def index
    @games = @theme.games.find(:all)

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
    @groups = Theme.find(@theme).groups
  end

  # GET /games/1;edit
  def edit
    @game = Game.find(params[:id])
    @groups = Theme.find(@theme).groups
    #@game.groups
    #TODO esse ou o de cima?
  end

  # POST /games
  # POST /games.xml
  def create
    @game = Game.new(params[:game])

    
    respond_to do |format|
      if  @theme.games << @game
        groups = params[:groups]
        groups.each do |group|
          @game.groups << Group.find(group.to_i)
        end 

        flash[:notice] = 'Jogo criado com sucesso.'
        format.html { redirect_to theme_games_url(@theme) }
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
        flash[:notice] = 'Jogo editado com sucesso.'
        format.html { redirect_to theme_games_url(@theme) }
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
      format.html { redirect_to theme_games_url(@theme) }
      format.xml  { head :ok }
    end
  end
  
  
  def play
    @game = Game.find(params[:id])
    #TODO remover a variavel groups
    #@groups = @game.groups
    @players = @game.players
    participations = @group.participations
    @player = @players.find_by_group_id(@group)
    
    #TODO colocar registricao de somente questoes aprovadas
    @questions = Activity.find(:all, :conditions => [ "participation_id IN (?) AND creation_type = 'Question'",participations])
    
    
    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @game.to_xml }
    end
    
  end

  private
  def find_theme
    @theme = Theme.find params[:theme_id]
  end

  def is_teacher
    reg = Registration.find_by_user_id_and_profile_id(session[:user], 2)
    if reg == nil
      flash[:notice] = "Voce não tem permissao para cadastrar um game"
      redirect_to themes_path
      #render :action => 'index'
    end
  end
  
  def find_group
    @group = Group.find params[:group_id]
  end
end

