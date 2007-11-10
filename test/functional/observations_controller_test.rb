require File.dirname(__FILE__) + '/../test_helper'
require 'observations_controller'

# Re-raise errors caught by the controller.
class ObservationsController; def rescue_action(e) raise e end; end

class ObservationsControllerTest < Test::Unit::TestCase
  fixtures :observations

  def setup
    @controller = ObservationsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:observations)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_observation
    old_count = Observation.count
    post :create, :observation => { }
    assert_equal old_count+1, Observation.count
    
    assert_redirected_to observation_path(assigns(:observation))
  end

  def test_should_show_observation
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_observation
    put :update, :id => 1, :observation => { }
    assert_redirected_to observation_path(assigns(:observation))
  end
  
  def test_should_destroy_observation
    old_count = Observation.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Observation.count
    
    assert_redirected_to observations_path
  end
end
