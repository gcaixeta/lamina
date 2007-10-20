require File.dirname(__FILE__) + '/../test_helper'
require 'links_controller'

# Re-raise errors caught by the controller.
class LinksController; def rescue_action(e) raise e end; end

class LinksControllerTest < Test::Unit::TestCase
  def setup
    @controller = LinksController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end

  def test_should_get_index
    get :index, :themes_id => 1
    assert_response :success
    assert_not_nil assigns(:links)
  end

end
