require "#{File.dirname(__FILE__)}/../test_helper"

class InstitutionNewTest < ActionController::IntegrationTest
  fixtures :users

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
		breakpoint
		post '/session/create', :login =>'jaum', :password => '1234'
	  follow_redirect!
		assert_response :success
		assert_template 'institutions/signup'
		post 'institutions/new', :institutions => { :name => 'Fatec', :cnpj => 1234, :telephone => 12345, :email => 'fatec@fataec.far'}
		assert_response :redirect
		follow_redirect!
		assert_response :success
		assert_template 'institutions/signup'
	end
end
