class InstitutionsController < ApplicationController
before_filter :login_required, :only => [ :signup ]
	#usuario

  def signup
    @institution = Institution.new
  end

  def create
    @institution = Institution.new(params[:institution])
    if @institution.save
      flash[:notice] = 'Institicao criada com sucesso.'
      redirect_to :controller => 'site' , :action => 'index'
    else
      render :action => 'signup'
    end
  end
  
	# administrador 

  def list
    @institutions = Institution.find_all_by_active(:false)
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
