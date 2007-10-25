require File.dirname(__FILE__) + '/../test_helper'
require 'institutions_controller'

# Re-raise errors caught by the controller.
class InstitutionsController; def rescue_action(e) raise e end; end

class InstitutionsControllerTest < Test::Unit::TestCase
  fixtures :users, :registrations, :institutions, :cities, :states, :profiles
  def setup
    @controller = InstitutionsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_need_login
#TODO Refatorar essa parte...
    get :signup
    assert_response :redirect

    post :create, :institutions => { :name => 'Fatec', :cnpj => '123456', :telephone => '1234561', :email => 'fatec@fatecriopreto.com' }
    assert_response :redirect

    get :inactive
    assert_response :redirect

  end

  def test_should_get_list_unactive_registration
    login_as :usp1
    get :inactive
    assert_response :success
    assert_template 'institutions/inactive'
    assert_not_nil assigns(:institutions)
  end

  def test_should_get_list_unactive_registration_only_if_is_admin
    login_as :usp1
    get :inactive
    assert_response :success
    assert_template 'institutions/inactive'
    assert_not_nil assigns(:institutions)
  end

  def test_should_get_index_user_permission
    login_as :quentin
    get :index
    assert_response :success
  end

  def test_should_get_index_user_not_permission
    login_as :aaron
    get :index
    assert_response :redirect
  end

   def test_should_show_permission_professor_themes
		login_as :usp1	
		get:show
                assert_response :redirect
   end


end

