require File.dirname(__FILE__) + '/../test_helper'
require 'archives_controller'

# Re-raise errors caught by the controller.
class ArchivesController; def rescue_action(e) raise e end; end

class ArchivesControllerTest < Test::Unit::TestCase
fixtures :archives, :users, :links, :registrations, :institutions, :cities, :states, :profiles, :themes, :configurations, :proposals
  def setup
    @controller = ArchivesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index, :theme_id => 1
    assert_response :success
    assert assigns(:archives)
  end

  def test_should_get_new
    get :new, :theme_id => 1
    assert_response :success
  end
  
  def test_should_create_archives
    old_count = Archives.count
        post :create, :theme_id => 1 , :archive => { :name => "Foto", :description => "Imagem de la", :heading => "nada"}
    assert_equal old_count+1, Archives.count
    
    assert_redirected_to theme_archive_path(assigns(:archive).theme, assigns(:archive))
  end

  def test_should_show_archives
    get :show, :id => 1, :theme_id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1, :theme_id => 1
    assert_response :success
  end
  
  def test_should_update_archives
    put :update, :id => 1, :archive => { :name => "Foto", :description => "Imagem de la", :heading => "nada"}, :theme_id => 1
    assert_redirected_to theme_archive_path(assigns(:archive).theme, assigns(:archive))
  end
  
  def test_should_destroy_archives
    old_count = Archives.count
    delete :destroy, :id => 1, :theme_id => 1
    assert_equal old_count-1, Archives.count
    
    assert_redirected_to theme_archive_path
  end
end
