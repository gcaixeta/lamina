class ThemesController < ApplicationController
before_filter :login_required,  :only => [ :new, :create ] 

def new
  #@theme = Theme.new
end

def create
    @theme = Theme.new(params[:theme])
    configuration = Configuration.create(params[:configuration])
    @theme.configuration_id = configuration.id
    if @theme.save
      flash[:notice] = 'Theme criada com sucesso.'
      redirect_to :controller => 'site' , :action => 'index'
    else
      render :action => 'new'
    end
  end

end
