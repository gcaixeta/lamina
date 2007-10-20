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
    get :index, :theme_id => 1
    assert_response :success
    assert_not_nil assigns(:links)
  end


  def test_should_get_new
    login_as 'usp1'
    get :new, :theme_id => 1
    assert_response :success
  end


  def test_should_create_link
    login_as 'usp1'
    old_count = Link.count
    post :create, :theme_id => 1, :link => { :address => "www.uol.com.br/tecnologia", :description => "tecno" }
    assert_equal old_count+1, Link.count
    
    assert_redirected_to theme_url(assigns(:link).theme_id)
  end




end
