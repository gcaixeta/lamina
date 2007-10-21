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
end
