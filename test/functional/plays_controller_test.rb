require File.dirname(__FILE__) + '/../test_helper'
require 'plays_controller'

# Re-raise errors caught by the controller.
class PlaysController; def rescue_action(e) raise e end; end

class PlaysControllerTest < Test::Unit::TestCase
  fixtures :plays

  def setup
    @controller = PlaysController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:plays)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_play
    old_count = Play.count
    post :create, :play => { }
    assert_equal old_count+1, Play.count
    
    assert_redirected_to play_path(assigns(:play))
  end

  def test_should_show_play
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_play
    put :update, :id => 1, :play => { }
    assert_redirected_to play_path(assigns(:play))
  end
  
  def test_should_destroy_play
    old_count = Play.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Play.count
    
    assert_redirected_to plays_path
  end
end
