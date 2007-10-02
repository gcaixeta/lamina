class RegistrationsController < ApplicationController
before_filter :login_required, :only => [ :signup ]


  def signup
    @registration = Registration.new
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
