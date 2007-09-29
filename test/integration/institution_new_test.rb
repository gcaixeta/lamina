require "#{File.dirname(__FILE__)}/../test_helper"

class InstitutionNewTest < ActionController::IntegrationTest
  fixtures :users, :cities, :states



  # Replace this with your real tests.
  def test_truth
    assert true
  end


	def test_should_login
		get '/institutions/signup'
		assert_response :redirect
		follow_redirect!
		assert_response :success
		assert_template 'session/new'
		post '/session/create', :login =>'jaum', :password => 'test'
    follow_redirect!
		assert_response :success
		assert_template 'institutions/signup'
		post 'institutions/create', :institution => { :name => 'Fatec', :cnpj => 1234, :telephone => 12345, :email => 'fatec@fatec.com.br'}
		assert_response :redirect
		follow_redirect!
		assert_response :success
		assert_template 'site/index'
	end
end
