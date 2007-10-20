class GroupsController < ApplicationController

  before_filter :find_theme

# p = Participation.find_all_by_group_id(1, :include=>[:interactions])

  def index
    @groups = @theme.groups
    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @groups.to_xml }
      format.rss  { render :xml => @groups.to_rss }
    end
  end


  def show
    @group = @theme.groups.find(params[:id])
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
end
