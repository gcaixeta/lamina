require File.dirname(__FILE__) + '/../test_helper'
require 'groups_controller'

# Re-raise errors caught by the controller.
class GroupsController; def rescue_action(e) raise e end; end

class GroupsControllerTest < Test::Unit::TestCase
  def setup
    @controller = GroupsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

# Dados para Testes
# use 7 8
# kiko nanda
# reg 5 6
# par 3 4
# theme 3
# group 5


  # Replace this with your real tests.
  def test_truth
    assert true
  end
  
  def test_get_index
    get :index
    assert_response :success
    
  end
  
  
  
  
  
  
  
  
  
  
  
end
