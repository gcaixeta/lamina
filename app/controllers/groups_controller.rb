class GroupsController < ApplicationController
  before_filter :login_required, :only => [ :index, :show ]
  before_filter :find_theme, :except => [:index, :show]
  before_filter :have_permission_to_view, :only => [:show]
  

# p = Participation.find_all_by_group_id(1, :include=>[:interactions])
# p = Participation.find_all_by_group_id(5, :include=>[:messages])


  def index
    @groups = Group.find(:all)
    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @groups.to_xml }
      format.rss  { render :xml => @groups.to_rss }
    end
  end


  def show
    @group = Group.find(params[:id])
    #rescue RecordNotFound
    #TODO colocar caso o usuario coloque um theme e grupo que nao bata
    #end
    respond_to do |format|
      format.html
      format.xml  { render :xml => @group.to_xml }
    end
  end

private

  def find_theme
    @theme = Theme.find params[:theme_id]
  end
  
  def have_permission_to_view
    #pega o id do grupo
    group = Group.find(params[:id])
    participations = Participation.find_all_by_group_id(group, :include=>[:registration])
    
    for participation in participations do
    if participation.registration.user_id == session[:user]
    puts "usuario #{session[:user]} autorizado!!!"
    else
    puts "usuario #{session[:user]} NAO autorizado!!!"
    end
    
    end

    #verifica qual instituicao? e ve se o usuario tem registration nela?
    #verifica se ele tem participation, ou proposal no theme do grupo
    
  end
end
