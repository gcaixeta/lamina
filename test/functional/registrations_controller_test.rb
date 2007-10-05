require File.dirname(__FILE__) + '/../test_helper'
require 'registrations_controller'

# Re-raise errors caught by the controller.
class RegistrationsController; def rescue_action(e) raise e end; end

class RegistrationsControllerTest < Test::Unit::TestCase
fixtures :users, :registrations, :institutions
  def setup
    @controller = RegistrationsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end


	def test_require_login_to_signup
				get :signup
				assert_response :redirect, "deve redirecionar para que o usuario loge"
				assert_template nil
	end
	
		def test_require_login_to_create
	     get :create
	     assert_response :redirect, " deve redirecionar para que o usuario cadastrar"
	     assert_template nil
	end
	
	def	test_check_params_of_post
		login_as 'quentin', 'test'
		get :signup,  :id =>1
		assert_template 'registrations/signup'
		#usuario preenche os dados
		#FIXME Corrigir esse erro
		assert_equal  1, assigns[:id]
		
		
		post :create, :invite => "theyue@yahoo.com.br", :institution =>1
		assert_equal 1, @request.session[:user], "O id do usuario deve bater"
		assert_equal "theyue@yahoo.com.br", "theyue@yahoo.com.br", "O email deve ser igual"
		assert_equal 1, 1, "A instituicao escolhida deve conferir"
		
				
	end

	def test_institution_in_registration_needs_to_existes_who_create
				login_as 'quentin', 'test'
							
				post :create, :invite => "theyue@yahoo.com.br", :institution =>"1"

				assert_not_nil @request.session[:user] , "Usuario deve logar"
				assert_equal 1, @request.session[:user] , "Usuario quentin deve ter id 1"

				assert_not_nil Registration.find_by_user_id_and_institution_id(@request.session[:user] , '1'), "Para o usuario convida alguem para uma instituicao o mesmo deve estar nela" 
			#	assert_response :redirect, "Deve ser redirecionado"
	#			assert_template "registrations/index"
	end



	def test_need_to_be_in_institution_to_invite_others
	#	login_as 'quentin', 'test'
#		puts @request.session[:user_id]
		#assert_not_nil Registration.find_by_user_id(@request.session[:user_id])
#		assert_equal @request.session[:user].id, registrations(:two).user_id
	end

	def test_get_registration_signup
				#login_as 'jaum', 'test'
#puts @request.session[:user].id
			#	get :signup
				
			#	assert_response :success , "Apos logado o usuario tem acesso ao cadastro"
			#	assert_template 'registrations/signup'
	end


	
	def test_id_of_user_is_not_the_same_of_login
	#O Id do usuario chamado no Login deve ser diferente
	    login_as 'jaum', 'test'
	    get :signup
			assert_equal 3, @request.session[:user], "O login do usuario deve ser 3"
	end


private

def login_as(login, password)
	@request.session[:user] = User.authenticate(login,password)

end




end
