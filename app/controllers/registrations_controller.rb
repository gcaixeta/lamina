class RegistrationsController < ApplicationController
before_filter :login_required, :only => [ :signup, :create ]

	def index
	
	end
  def signup
    @institution = params[:id]
  end


  def create
    @registration = Registration.new(params[:registration])
    if @registration.save
      flash[:notice] = 'Registrado com sucesso.'
      redirect_to :controller => 'site' , :action => 'index'
    else
      render :action => 'signup'
    end
  end
end
