require File.dirname(__FILE__) + '/../test_helper'
require 'games_controller'

# Re-raise errors caught by the controller.
class GamesController; def rescue_action(e) raise e end; end

class GamesControllerTest < Test::Unit::TestCase
  fixtures :games

  def setup
    @controller = GamesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:games)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_game
    old_count = Game.count
    post :create, :game => { }
    assert_equal old_count+1, Game.count
    
    assert_redirected_to game_path(assigns(:game))
  end

  def test_should_show_game
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_game
    put :update, :id => 1, :game => { }
    assert_redirected_to game_path(assigns(:game))
  end
  
  def test_should_destroy_game
    old_count = Game.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Game.count
    
    assert_redirected_to games_path
  end
end
