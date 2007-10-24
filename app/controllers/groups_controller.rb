class GroupsController < ApplicationController
  before_filter :login_required, :only => [ :index, :show ]
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
  
  def last_msgs
  p = Participation.find_all_by_group_id(5, :include=>[:messages])
  @messages = p.first.messages
  page.insert_html :bottom, 'messages', :partial => 'message', :collection => @messages
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
