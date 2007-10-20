class LinksController < ApplicationController


  before_filter :find_theme

  # GET /link
  # GET /links.xml
  def index
    @links = @theme.links.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @links.to_xml }
    end
  end
  
  # GET /links/1
  # GET /links/1.xml
  def show
    @link = Link.find(params[:id])
    
    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @link.to_xml }
    end
  end
  

# GET /links/new
  def new
    @link = Link.new
  end
  

  # GET /episodes/1;edit
  def edit
    @link = Link.find(params[:id])
  end

  # POST /links
  # POST /links.xml
  def create
    
    @link = Link.new(params[:link])
    theme = Theme.find(params[:theme_id])
    
    respond_to do |format|
      if theme.links << @link
        flash[:notice] = 'Link foi criado com sucesso.'
        
        format.html { redirect_to theme_link_url(@link.theme, @link) }
        format.xml do
          headers["Location"] = link_url(@link)
          render :nothing => true, :status => "201 Created"
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @link.errors.to_xml }
      end
    end
  end

  # PUT /links/1
  # PUT /links/1.xml
  def update
    @link = Link.find(params[:id])
    
    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to theme_url(@link.theme_id) }
        format.xml  { render :nothing => true }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @link.errors.to_xml }        
      end
    end
  end
  
  
  # DELETE /links/1
  # DELETE /links/1.xml
  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    
    respond_to do |format|
      format.html { redirect_to links_url   }
      format.xml  { render :nothing => true }
    end
  end
  


private
  def find_theme
    @theme = Theme.find params[:theme_id]
  end

end
