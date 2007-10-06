class RegistrationsController < ApplicationController
before_filter :login_required, :only => [ :signup, :create ]

	def index
	
	end
  def signup
    @institution = params[:id]
  end


  def create
  #verifica se tem algum usuario com o parametro de invite que foi passado pelo formulario
  
  	@usuario = User.find(:first, :conditions => ["login = ? OR email =?" , params[:invite], params[:invite]])
  	

  	if @usuario == nil
  	

  	#flash[:notice] = ' Usuario não está cadastrado no sistema'	
  	else

	 @registration = Registration.create(:user_id => @usuario.id, :institution_id => params["institution"], :profile_id => 1)
  		if @registration.save
  		puts @registration.id
  		end

  
    #@registration = Registration.new(params[:registration])
    #if @registration.save
      #flash[:notice] = 'Registrado com sucesso.'
      #redirect_to :controller => 'site' , :action => 'index'
    #else
     # render :action => 'signup'
  		#end
  		end
  			redirect_to :controller => 'site' , :action => 'index'
  end
end
