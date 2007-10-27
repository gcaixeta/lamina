require File.dirname(__FILE__) + '/../test_helper'
require 'interactions_controller'

# Re-raise errors caught by the controller.
class InteractionsController; def rescue_action(e) raise e end; end

class InteractionsControllerTest < Test::Unit::TestCase
  fixtures :interactions

  def setup
    @controller = InteractionsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:interactions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_interaction
    old_count = Interaction.count
    post :create, :interaction => { }
    assert_equal old_count+1, Interaction.count
    
    assert_redirected_to interaction_path(assigns(:interaction))
  end

  def test_should_show_interaction
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_interaction
    put :update, :id => 1, :interaction => { }
    assert_redirected_to interaction_path(assigns(:interaction))
  end
  
  def test_should_destroy_interaction
    old_count = Interaction.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Interaction.count
    
    assert_redirected_to interactions_path
  end
end
