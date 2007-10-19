class ThemesController < ApplicationController

before_filter :login_required, :only => [ :new, :create, :update, :destroy, :show, :edit, :index ]

before_filter :is_teacher, :only => [:new, :create, :update, :destroy, :edit]

def new
  @registrations = Registration.find_all_by_user_id_and_profile_id(session[:user],2)
end

def index
    @theme = Theme.find(:all)
        
    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @theme.to_xml }
    end
end

  # GET /programs/1
  # GET /programs/1.xml
  def show
    @theme = Theme.find(params[:id])
    
    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @theme.to_xml }
    end
  end



def create
    @theme = Theme.new(params[:theme])
    configuration = Configuration.create(params[:configuration])
    @theme.configuration_id = configuration.id
    if @theme.save
      #arumar uma forma de pegar o id do registration que é passado no combobox
      
      r = Registration.find(params[:registration][:id])
      @theme.registrations << r
      flash[:notice] = 'Theme criada com sucesso.'
      redirect_to :controller => 'themes' , :action => 'index'
    else
      render :action => 'new'
    end
  end

  def edit
    @theme = Theme.find(params[:id])
  end

def update
    @theme = Theme.find(params[:id])
    
    respond_to do |format|
      if @theme.update_attributes(params[:theme])
        format.html { redirect_to theme_url(@theme) }
        format.xml  { render :nothing => true }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @theme.errors.to_xml }        
      end
    end
  end
  
  # DELETE /programs/1
  # DELETE /programs/1.xml
  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy

    respond_to do |format|
      format.html do
        redirect_to theme_url
      end
      format.js # run the destroy.rjs template
      format.xml  do
        render :nothing => true
      end
  end
end




private
        def is_teacher
                reg = Registration.find_by_user_id_and_profile_id(session[:user], 2)
                if reg == nil
                    flash[:notice] = "Voce não tem permissao para cadastrar um tema"
                  redirect_to themes_path
                    #render :action => 'index'
                end
        end

end
