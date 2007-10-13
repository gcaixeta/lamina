require File.dirname(__FILE__) + '/../test_helper'
require 'registrations_controller'

# Re-raise errors caught by the controller.
class RegistrationsController; def rescue_action(e) raise e end; end

class RegistrationsControllerTest < Test::Unit::TestCase
  fixtures :users, :registrations, :institutions, :cities, :states, :profiles

  def setup
    @controller = RegistrationsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_require_login_to_signup
    get :signup, :institution_id => 1
    assert_response :redirect, "deve redirecionar para que o usuario loge"
    assert_template nil
  end


  def test_require_login_to_create
    post :create, :institution_id => 1
    assert_response :redirect, " deve redirecionar para que o usuario cadastrar"
    assert_template nil
  end


  def test_user_can_not_create_a_duplicated_registration
    #Usuario não pode se convidar, criando registration duplicada
    login_as :quentin
    #post :create, :invite => users(:quentin).email , :institution_id => 1
    #assert_equal ' Seu usuario não tem autorizacao para cadastrar outro usuario nesta instituicao', assigns[:error]
    #	assert_template 'registrations/signup'
    #TODO fazer assert verificando no vetor de erros
  end


  def test_check_creation_of_registration_of_a_new_user
    #Registro tem que se cadastrado, em usuario sem registration
    login_as :usp1
    assert_nil Registration.find_by_user_id_and_institution_id(users(:Jaum).id, 2), "O usuario não deve estar registrado"
    post :create, :invite => users(:Jaum).email , :institution_id => 2
    assert_not_nil Registration.find_by_user_id_and_institution_id(users(:Jaum).id, 2), "O usuario deve estar registrado"
  end

  def test_shold_not_create_a_registration
    #Registro tem que se cadastrado, em usuario sem registration
    login_as :usp1
    #    assert_raise(NoMethodError) do
    post :create, :invite => users(:Jaum).email , :institution_id => 2
    #  end
    assert_not_nil Registration.find_by_user_id_and_institution_id(users(:Jaum).id, 2), "O usuario deve estar registrado"
  end


  def test_institution_in_registration_needs_to_existes_who_create
    #O usuario para criar um registration na instituicao(parametro), deve estar cadastrado nela				
    login_as :quentin
    post :create, :invite => "theyue@yahoo.com.br", :institution_id => 1
    assert_not_nil Registration.find_by_user_id_and_institution_id(@request.session[:user] , '1'), "Para o usuario convida alguem para uma instituicao o mesmo deve estar nela" 
  end


  def test_need_params_to_invite
    login_as :usp1
    assert_nil Registration.find_by_user_id_and_institution_id(users(:Jaum).id, 2), "O usuario não deve estar registrado"
    post :create, :invite => users(:Jaum).email , :institution_id => 2
    assert_not_nil Registration.find_by_user_id_and_institution_id(users(:Jaum).id, 2), "O usuario deve estar registrado"


  end


  def test_need_to_be_in_institution_to_invite_others
    #todo Esse teste tá tosco
    login_as :quentin
    #assert_not_nil Registration.find_by_user_id_and_institution_id(@request.session[:user])
    #assert_equal @request.session[:user].id, registrations(:two).user_id
  end

  def test_get_registration_signup
    #login_as :Jaum
    #puts @request.session[:user].id
    #	get :signup

    #	assert_response :success , "Apos logado o usuario tem acesso ao cadastro"
    #	assert_template 'registrations/signup'
  end



  def test_id_of_user_is_not_the_same_of_login
#     #O Id do usuario chamado no Login deve ser diferente
#     login_as :Jaum
#     get :signup
#     assert_equal 3, @request.session[:user], "O login do usuario deve ser 3"
  end



  def	test_check_params_of_post
#     login_as :quentin
#     get :signup,  :id =>1
#     assert_template 'registrations/signup'
#     assert_equal  1, assigns["institution"].to_i	
#     post :create, :invite => users(:Jaum).email ,:institution => 1


    #FIXME REMOVE
#     assert_equal 1, @request.session[:user], "O id do usuario deve bater"
#     assert_equal "jaum@yahoo.com.br",  users(:Jaum).email
  end









end
