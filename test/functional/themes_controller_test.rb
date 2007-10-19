require File.dirname(__FILE__) + '/../test_helper'
require 'themes_controller'

# Re-raise errors caught by the controller.
class ThemesController; def rescue_action(e) raise e end; end

class ThemesControllerTest < Test::Unit::TestCase
fixtures :users, :registrations, :institutions, :cities, :states, :profiles, :themes, :configurations, :proposals
  def setup
    @controller = ThemesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_new
    get :new    
    assert_response :redirect
  end

  def test_create
    get :create    
    assert_response :redirect
  end
  
    def test_should_get_edit
    login_as :usp1
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_show_theme
    login_as :usp1
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_index
    login_as :usp1
    get :index
    assert_response :success
    assert assigns(:registrations)
  end

  def test_user_session
    login_as :usp1
    get :new    
    assert_response :success           
    assert_equal 9, @request.session[:user] 
  end  

  def test_user_profile_professor
    login_as :usp1
    get :new    
    assert_response :success           
    assert_equal 9,@request.session[:user]    
    assert_equal 2, Registration.find_by_user_id_and_institution_id(session[:user], 2).profile_id      
  end

  def test_should_create_post_theme
        login_as :usp1
        old_count = Theme.count
        post :create, :theme => {:name => 'Tecnologia',  :summary => 'Mundo Atual', :active => '1', :password => '1234'}, :configuration => {:questions_max => '10', :number_participants => 5}, :registration => {:id => '7'}
      assert_equal old_count +1 , Theme.count
  end


  def test_should_not_user_professor_not_create
        login_as :Jaum
        get :new
        assert_response :redirect
  end






  
  def test_should_destroy_theme
    login_as :usp1
    old_count = Theme.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Theme.count
    
    assert_redirected_to theme_path
  end



end
