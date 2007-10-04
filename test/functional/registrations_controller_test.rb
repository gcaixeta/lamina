require File.dirname(__FILE__) + '/../test_helper'
require 'registrations_controller'

# Re-raise errors caught by the controller.
class RegistrationsController; def rescue_action(e) raise e end; end

class RegistrationsControllerTest < Test::Unit::TestCase
fixtures :users
  def setup
    @controller = RegistrationsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end

	def test_institution_in_registration_needs_to_existes_who_create
				login_as 'jaum', 'test'				
				post :create, :invite => "gustavo", :institution =>"1"
				assert_not_nil @request.session[:user] , "Usuario deve logar"
				assert_nil Registration.find(:first)#find_by_user_and_institution(:user => @request.session[:user], :institution => '1')
		#		assert_response :redirect, "Deve ser redirecionado"
	#			assert_template "registrations/index"
	end

	def test_require_login_to_create
	end

	def test_need_to_be_in_institution_to_invite_others
	end

	def test_get_registration_signup
				login_as 'jaum', 'test'
#puts @request.session[:user].id
				get :signup
				
				assert_response :success , "Apos logado o usuario tem acesso ao cadastro"
				assert_template 'registrations/signup'
	end

	def test_should_login_to_create
				get :signup
				assert_response :redirect, "deve redirecionar para que o usuario loge"
	end


private

def login_as(login, password)
	@request.session[:user] = User.authenticate(login,password)

end




end
