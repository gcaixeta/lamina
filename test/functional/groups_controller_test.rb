require File.dirname(__FILE__) + '/../test_helper'
require 'groups_controller'

# Re-raise errors caught by the controller.
class GroupsController; def rescue_action(e) raise e end; end

class GroupsControllerTest < Test::Unit::TestCase

fixtures :users, :registrations, :institutions, :profiles, :groups, :participations, :interactions

  def setup
    @controller = GroupsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

# Dados para Testes
# use 7 8
# :usa3 :usa4
# kiko nanda
# reg 5 6
# par 3 4
# theme 3
# group 5


  # Replace this with your real tests.
  def test_truth
    assert true
  end
  
  def test_get_index_and_require_login
    get :index
    assert_response :redirect
  end
  
  def test_get_show_and_require_login
    get :show, :id => 5
    assert_response :redirect
  end

  def test_get_index
    login_as :usa3
    get :index
    assert_response :success
  end
  
  def test_get_show
    login_as :usa3
    get :show, :id => 5
    assert_response :success
  end
  
    def test_get_show_without_permission
    login_as :quentin
    get :show, :id => 5
    assert_response :success
  end
  
  
  
  
  
  
  
  
  
  
end
