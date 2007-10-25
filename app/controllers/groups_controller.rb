class GroupsController < ApplicationController
  before_filter :login_required, :only => [ :index, :show, :list ]
  before_filter :find_theme, :except => [:index, :show, :last_msgs]
  before_filter :have_permission_to_view, :only => [:show]
  before_filter :have_proposal_in_theme, :only => [:new, :create, :update, :edit, :destroy]      

  # p = Participation.find_all_by_group_id(1, :include=>[:interactions])
  # p = Participation.find_all_by_group_id(5, :include=>[:messages])




  #Planejamento de URL do Grupos
  #URLs de acesso do Professor
  #/themes/:theme_id/groups/new -get
  #/themes/:theme_id/groups/create - post
  #/themes/:theme_id/groups/edit - get
  #/themes/:theme_id/groups/update - put
  #/themes/:theme_id/groups/destroy - delete
  #/themes/:theme_id/groups/list - Listar por ultima interacao

  def new
        
  end

  def create
    group = Group.new(params[:group])

    if @theme.groups << group
      @theme.save
      participations = params[:participations]

      if participations != nil     
        logins = participations.split(', ')
        institution_id = Proposal.find_by_theme_id(params[:theme_id]).registration.institution_id
        for login in logins
          registrations = User.find_by_login(login).registrations.find_by_institution_id_and_profile_id(institution_id,1) #TODO verificar find, se nao deve colocar all
          if registrations != nil #colocar [] se for vetor
            group.registrations << registrations
          end
        end
      end
      # 1 - Localizar user_id
      # 2 - Verificar se ele tem registration, na instituição do grupo (pegar por themes > proposal >registration_institution_id ?
      # 3 - tem registration?
      # 4 - cria as participations com o id da registration
      # 5 fazer loop em todos os logins?
      flash[:notice] = 'Grupo foi criado com sucesso.'
      redirect_to list_theme_groups_path(params[:theme_id])          
    else  
      render :action => 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end


  def update
    @group = Group.find(params[:id])
    
    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to list_theme_groups_path(params[:theme_id])          }
        format.xml  { render :nothing => true }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors.to_xml }        
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    
    respond_to do |format|
      format.html { redirect_to list_theme_groups_path(params[:theme_id])          }
      format.xml  { render :nothing => true }
    end
  end

  def list
    @groups = Group.find_all_by_theme_id(@theme)
  end


  def index
    @groups = Group.find(:all)
    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @groups.to_xml }
      format.rss  { render :xml => @groups.to_rss }
    end
  end


  def show
    
    #rescue RecordNotFound
    #TODO colocar caso o usuario coloque um theme e grupo que nao bata
    #end
    respond_to do |format|
      format.html do

      end
      format.xml  { render :xml => @group.to_xml }
    end
  end
  
  #exemplos
  #Person.find(:all, :offset => 10, :limit => 10)
  #Person.find(:first, :conditions => [ "user_name = ?", user_name])
  #Person.find(1, 2, 6) 
  #Person.find([7, 17]) 
  #  { :status => nil, :group_id => [1,2,3] }
    # => "status IS NULL and group_id IN (1,2,3)"
    
    # m = Message.find(:all, :conditions => [ "participation_id IN (3,4)"])

#part = Participation.find_all_by_group_id(5)
#m = Message.find(:all, :conditions => [ "participation_id IN (?)", part])

  
  def last_msgs
    p = Participation.find_all_by_group_id(5, :include=>[:messages])
    @messages = p.first.messages
   
  end

  private

  def find_theme
    @theme = Theme.find params[:theme_id]
  end
  
  def have_permission_to_view
    #pega o id do grupo
    @group = Group.find(params[:id])
    participations = Participation.find_all_by_group_id(@group, :include=>[:registration])
      
      
      
    #loop do verification of participations of students
    for participation in participations do

      if participation.registration.user_id != session[:user]
        autorized = false
      else
        autorized = true
        break #stop the verification of participation / registration
      end
    end


    #TODO Otimizar isso...
    #se nao tiver autorizacao, verifica se é professor da thematica do grupo
    if autorized == false
      for proposal in @group.theme.proposals do
        if proposal.registration.user_id != session[:user]
          autorized = false
        else
          autorized = true
          break #stop the verification of participation / registration
        end
      end
    end


    if autorized == false
      flash[:error] = "Seu usuario não tem autorizacao entrar neste ambiente do grupo '#{@group.name}'"
      redirect_to :controller => '/site', :action => 'index'
    end

    
  end


  def have_proposal_in_theme
    #filtro para identificar se o professor tem um proposals senao ele nao podera edit e update

    registrations = Theme.find(@theme).registrations.find_all_by_user_id_and_profile_id(session[:user], 2)   
    if registrations == []
      flash[:error] = "Não tem permissao para criar um grupo'"
      redirect_to themes_path
    end 

  end
end
