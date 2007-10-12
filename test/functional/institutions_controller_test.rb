require File.dirname(__FILE__) + '/../test_helper'
require 'institutions_controller'

# Re-raise errors caught by the controller.
class InstitutionsController; def rescue_action(e) raise e end; end

class InstitutionsControllerTest < Test::Unit::TestCase
  def setup
    @controller = InstitutionsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_need_login

    get :signup
    assert_response :redirect

    post :create, :institutions => { :name => 'Fatec', :cnpj => '123456', :telephone => '1234561', :email => 'fatec@fatecriopreto.com' }
    assert_response :redirect

    get :inactive
    assert_response :redirect

  end

  def test_should_get_list_unactive_registration


  end



end

