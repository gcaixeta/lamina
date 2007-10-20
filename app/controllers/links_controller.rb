class LinksController < ApplicationController


  before_filter :find_theme

  def index
    @links = @theme.links

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @links.to_xml }
      format.rss  { render :xml => @theme.to_rss }
    end
  end



private
  def find_theme
    @theme = Theme.find params[:theme_id]
  end

end
