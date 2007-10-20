require File.dirname(__FILE__) + '/../test_helper'
require 'links_controller'

# Re-raise errors caught by the controller.
class LinksController; def rescue_action(e) raise e end; end

class LinksControllerTest < Test::Unit::TestCase

fixtures :users, :links, :registrations, :institutions, :cities, :states, :profiles, :themes, :configurations, :proposals
  def setup
    @controller = LinksController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end


  def test_should_get_index
    login_as :usp1
    get :index, :theme_id => 1
    assert_response :success
    assert_not_nil assigns(:links)
  end


  def test_should_get_new
    login_as :usp1
    get :new, :theme_id => 1
    assert_response :success
  end


  def test_should_create_link
    login_as :usp1
    old_count = Link.count
    post :create, :theme_id => 1, :link => { :address => "www.uol.com.br/tecnologia", :description => "tecno" }
    assert_equal old_count+1, Link.count
    
    assert_redirected_to theme_link_url(assigns(:link).theme, assigns(:link))

  end
  
    def test_should_show_link
    login_as :usp1
    get :show, :id => 1, :theme_id => 1
    assert_response :success
  end

  def test_should_get_edit
    login_as :usp1
    get :edit, :id => 1, :theme_id => @theme.id
    assert_response :success
  end
  
  
  def test_should_get_edit
    login_as :usp1
    get :edit, :id =>1 , :theme_id => 1
    assert_response :success
  end

  def test_should_update_link
   login_as :usp1
    put :update, :id => 1, :link => { :address => "www.uol.aacom.br/tecnologia", :description => "tecnoddd" }, :theme_id => 1
    assert_redirected_to theme_link_url(assigns(:link).theme, assigns(:link))
  end
  
    def test_should_destroy_link
    login_as :usp1
    old_count = Link.count
    delete :destroy, :id => 1, :theme_id => 1
    assert_equal old_count-1, Link.count
    
   # assert_redirected_to theme_path(assigns(:link).theme_id)
  end
    
    def test_xhr_should_destroy_link
    login_as :usp1
    old_count = Link.count
    xhr :delete, :destroy, :id => 1 , :theme_id => 1
    assert_equal old_count-1, Link.count
    
    #assert_response :success
  end


end
