require File.dirname(__FILE__) + '/../test_helper'
require 'site_controller'

# Re-raise errors caught by the controller.
class SiteController; def rescue_action(e) raise e end; end

class SiteControllerTest < Test::Unit::TestCase
  def setup
    @controller = SiteController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end

	def test_index
		get :index
		assert_response :success
	end
	
	def test_blbla
				login_as "jaum" , "test"
				get :index
				assert_equal 3, @request.session[:user] 
				assert_equal "jaum" , User.find(@request.session[:user]).login
	end
	
	
	
	def login_as(login, password)
	@request.session[:user] = User.authenticate(login,password)
	end

  
end
