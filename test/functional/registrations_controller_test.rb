require File.dirname(__FILE__) + '/../test_helper'
require 'registrations_controller'

# Re-raise errors caught by the controller.
class RegistrationsController; def rescue_action(e) raise e end; end

class RegistrationsControllerTest < Test::Unit::TestCase
  def setup
    @controller = RegistrationsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end

	def test_get_registration_signup
				login_as 'jaum', 'test'
				get :signup
				assert_response :success , "Apos logado o usuario tem acesso ao cadastro"
				assert_template 'registrations/signup'
	end

	def test_should_login_to_create
				get :signup
				assert_response :redirect
	end

  def login_as(login, password)
	@request.session[:user] = User.authenticate(login,password)
end




end
