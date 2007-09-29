require "#{File.dirname(__FILE__)}/../test_helper"

class InstitutionNewTest < ActionController::IntegrationTest
  fixtures :users

def setup
State.create(:name => "SP")
City.create(:name => "Rio Preto", :state_id => 1)
  post '/user/create', :user => { :login =>'jaum', :password => '1234', :email => 'jr16p@yahoo.com.br', :city_id => 1 }

end

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
