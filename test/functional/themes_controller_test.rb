require File.dirname(__FILE__) + '/../test_helper'
require 'themes_controller'

# Re-raise errors caught by the controller.
class ThemesController; def rescue_action(e) raise e end; end

class ThemesControllerTest < Test::Unit::TestCase
fixtures :users, :registrations, :institutions, :cities, :states, :profiles
  def setup
    @controller = ThemesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_sigunp
    get :signup    
    assert_response :redirect
    assert_template nil
  end

  def test_create
    get :create    
    assert_response :redirect
    assert_template nil
  end

  def test_user_session
    login_as :usp1
    get :signup    
    assert_response :success           
    assert_equal 9, @request.session[:user] 
  end  

  def test_user_profile_professor
    login_as :usp1
    get :signup    
    assert_response :success           
    assert_equal 9,@request.session[:user]    
    assert_equal 2, Registration.find_by_user_id_and_institution_id(session[:user], 2).profile_id      
  end

end
