class InstitutionsController < ApplicationController

  def new
    @institution = Institution.new
  end

  def index
    @institution_pages, @institutions = paginate :institutions, :per_page => 10
  end

  def create
    @institution = Institution.new(params[:institution])
    if @institution.save
      flash[:notice] = 'Institicao criada com sucesso.'
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end
  
  def active
	render :layout => false
	@institution = Institution.find(params[:id])
	@institution.active = 1
	@institution.save
  end

  def desative
	render :layout => false
	@institution = Institution.find(params[:id])
	@institution.active = 0
	@institution.save
  end

end 
