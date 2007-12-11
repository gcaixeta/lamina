class UsersController < ApplicationController

  # render new.rhtml
  def new
  #    @user = User.new
  #  @cities = City.find(:all).collect{|c|[c.name,c.id]}
  
	end

  def create
    @user = User.new(params[:user])
    @user.save!
    self.current_user = @user
    redirect_back_or_default('/')
    flash[:notice] = "Usuario Cadastrado!!!"
  rescue ActiveRecord::RecordInvalid
#		redirect_to :action => 'new'    
render :action => 'new'
  end

end
