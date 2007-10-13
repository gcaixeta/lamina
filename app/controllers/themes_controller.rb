class ThemesController < ApplicationController
before_filter :login_required,  :only => [ :new, :create, :update]

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

end
