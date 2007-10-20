class ArchivesController < ApplicationController


  before_filter :find_theme
  # GET /archives
  # GET /archives.xml
  def index
    @archives = @theme.archives.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @archives.to_xml }
    end
  end

  # GET /archives/1
  # GET /archives/1.xml
  def show
    @archive = Archive.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @archive.to_xml }
    end
  end

  # GET /archives/new
  def new
    @archive = Archive.new
  end

  # GET /archives/1;edit
  def edit
    @archive = Archive.find(params[:id])
  end

  # POST /archives
  # POST /archives.xml
  def create
    @archive = Archive.new(params[:archive])
    theme = Theme.find(params[:theme_id])

    respond_to do |format|
      if  theme.archives << @archive
        flash[:notice] = 'Archives was successfully created.'
        format.html { redirect_to theme_archives_url  }
        format.xml  { head :created, :location => archives_url(@archive) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @archive.errors.to_xml }
      end
    end
  end

  # PUT /archives/1
  # PUT /archives/1.xml
  def update
    @archive = Archive.find(params[:id])

    respond_to do |format|
      if @archive.update_attributes(params[:archive])
        flash[:notice] = 'Archives was successfully updated.'
        format.html { redirect_to theme_archives_url  }
        format.xml  { render :nothing => true }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @archive.errors.to_xml }
      end
    end
  end

  # DELETE /archives/1
  # DELETE /archives/1.xml
  def destroy
    @archive = Archive.find(params[:id])
    @archive.destroy

    respond_to do |format|
      format.html { redirect_to theme_archives_url }
      format.xml  { head :ok }
    end
  end
  
  private
  def find_theme
    @theme = Theme.find params[:theme_id]
  end
end
