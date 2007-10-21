class InstitutionsController < ApplicationController
before_filter :login_required, :only => [:index ]

before_filter :is_teacher, :only => [ :signup, :create, :inactive]
	#usuario

  def index
    @institutions = Registration.find_all_by_user_id(session[:user])
  end

  def signup
   #@institution = Institution.new
  end

  def create
    @institution = Institution.new(params[:institution])
    if @institution.save
      flash[:notice] = 'Instituicao criada com sucesso.'
      redirect_to :controller => 'site' , :action => 'index'
    else
      render :action => 'signup'
    end
  end
  
	# administrador 


  def list
  end

  def inactive
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

private
        def is_teacher
                reg = Registration.find_by_user_id_and_profile_id(session[:user], 2)
                if reg == nil
                    flash[:notice] = "Voce não tem permissao para cadastrar um tema"
                  redirect_to institutions_path
                    #render :action => 'index'
                end
        end
        


end 
