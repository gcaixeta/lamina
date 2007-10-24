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
  
  # TESTs have_permission_to_view
  
  def test_get_show
    login_as :usa3
    get :show, :id => 5
    assert_response :success
  end
  
  def test_get_show_without_permission
    login_as :quentin
    get :show, :id => 5
    assert_response :redirect
  end
  
  def test_get_show_as_autorized_teacher
    login_as :usp1
    get :show, :id => 5
    assert_response :success
  end
  
  def test_get_show_as_not_autorized_teacher
    login_as :usp2
    get :show, :id => 5
    assert_response :redirect
  end
  
  

  #TESTs CHAT
  
  
  
  
  #Test da parte de Themes

# Test para verificar se o professor e o autor da tematica para criar o grupo
def test_verify_teache_owner_theme_new_group
      login_as :usp2
      get :new, :theme_id => 2  
      assert_response :success      
end
  

# Test que verificar que o professor nao é o dono da tematica assim ele nao cria o grupo 
def test_verify_teache_owner_theme_not_new_group
      login_as :usp1
      get :new, :theme_id => 2  
      assert_response :redirect      
end
  

def test_verify_teache_owner_theme_create_group
      login_as :usp2
      post :create, :theme_id =>2
      assert_response :success
      assert_template 'groups/new'
end

def test_verify_teache_owner_theme_not_create_group
      login_as :usp1
      post :create, :theme_id =>2
      assert_response :redirect
      assert_redirected_to themes_path
end

def test_should_create_a_group_in_theme
         login_as :usp2
        old_count = Group.count
         post :create, :theme_id => 1, :group => { :name => "Nome" }
         assert_equal old_count+1, Group.count
         assert_redirected_to list_theme_groups_path(1)
end
  
 
 def test_should_get_not_ permiss_edit
    login_as :usp1
    get :edit, :id =>1 , :theme_id => 2
    assert_response :redirect
  end
 
  def test_should_get_edit
    login_as :usp1
    get :edit, :id =>1 , :theme_id => 1
    assert_response :success
  end

  def test_should_update_group
   login_as :usp1
    put :update, :id => 1,   :theme_id => 1, :group => { :name => "Nome" }
         assert_redirected_to list_theme_groups_path(1)
  end  

  def test_should_not_permission_update_group
   login_as :usp1
    put :update, :id => 1,   :theme_id => 2, :group => { :name => "Nome" }
   assert_response :redirect
  end  

 def test_should_destroy_link
    login_as :usp1
    old_count = Group.count
    delete :destroy, :id => 1, :theme_id => 1
    assert_equal old_count-1, Group.count
    
    assert_redirected_to list_theme_groups_path(1)
  end  

 def test_should_destroy_link
    login_as :usp1
    old_count = Group.count
    delete :destroy, :id => 1, :theme_id => 2
    assert_equal old_count, Group.count
    assert_response :redirect
  end  

  def test_should_list
        login_as :usp1
         get :list, :theme_id  => 1
        assert_response :success
  end

  def test_should_not_list
        login_as :usp1
         get :list, :theme_id  => 2
        assert_response :success
  end

  def test_should_not_list
         get :list, :theme_id  => 1
        assert_response :redirect
  end

end
