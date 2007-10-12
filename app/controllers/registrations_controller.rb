class RegistrationsController < ApplicationController
  before_filter :login_required, :only => [ :signup, :create ]

  def index

  end


  def signup
    #@institution = params[:id]
  end


  def create
    #TODO Validar parametros passados, invite e institution. Verificar existencia antes de fazer a busca
    #verifica qual profile pode ser criado nessa registration
registration = Registration.find_by_user_id_and_institution_id(session[:user],params[:institution_id])

if registration == nil
  profile_id = nil
elsif registration == 2
  profile_id = 1
elsif registration == 3
  profile_id = 2
else
  profile_id = nil
end

    #Verifica se o usuario já existe no sistema, pelos parametros de convite
    usuario = User.find(:first, :conditions => ["login = ? OR email =?" , params[:invite], params[:invite]])


    if usuario == nil
      #TODO Fazer com que o usuario seja convidado para entrar no sistema
      # Criar usuario em branco com codigo para ser ativado?
      # Criar uma tabela de convites para instituição, com codigo para o usuario ser convidado?

      flash[:error] = ' Usuario não está cadastrado no sistema'	
      redirect_to :controller => 'site' , :action => 'index'
    elsif profile_id ==nil
      flash[:error] = ' Seu usuario não tem autorizacao para cadastrar outro usuario nesta instituicao'	
      redirect_to :action => 'signup'
    else
      @registration = Registration.create(:user_id => usuario.id, :institution_id => params[:institution], :profile_id => profile_id)
      redirect_to :controller => 'site' , :action => 'index'	
    end  

  end
end
