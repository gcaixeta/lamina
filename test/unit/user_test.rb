require File.dirname(__FILE__) + '/../test_helper'

class UserTest < Test::Unit::TestCase
  fixtures :users, :cities

  def test_should_be_invalid
    user = create(:name => nil, :email => nil, :login => nil, :city_id => 1)
    assert_invalid user, "User shouldn't be created"
  end
  
     # validar o name do user
 def test_should_require_name
    user = create(:name => nil)
    assert user.errors.invalid?(:name), ":name should be required"
    assert_invalid user, "User shouldn't be created"
  end
  
    # validar o city_id do user
  def test_should_require_city_id
    user = create(:city_id => nil)
    assert user.errors.invalid?(:city_id), ":city_id should be required"
    assert_invalid user, "User shouldn't be created"
  end

   # validar o email do user
  def test_should_require_email
    user = create(:email => nil)
    assert user.errors.invalid?(:email), ":email should be required"
    assert_invalid user, "User shouldn't be created"
  end
  
   # validar o formato do email do user
  def test_should_deny_bad_email
    user = create(:email => 'bad@format')
    assert user.errors.invalid?(:email), ":email should be in a valid format"
    assert_invalid user, "User shouldn't be created"
  end

   # nao permite a criacao duplicada de usuario
  def test_should_deny_duplicate_user
    user = create
    assert_valid user
    
    user = create
    assert_invalid user, "User shouldn't be created"
  end
  
	# validar o int do codigo city_id da tabela user
  def test_should_deny_non_integer_city
  user = create(:city_id => 'a')
  assert user.errors.invalid?(:city_id), ":city_id should have had an error"
  assert_invalid user, "user shouldn't be created"
  
  user = create(:city_id => 1.397)
  assert user.errors.invalid?(:city_id), ":city_id should have had an error"
  assert_invalid user, "user shouldn't be created"
  end

def test_should_check_user_authorship
  # check all fixtures were loaded
  assert_equal 2, cities(:rp).users.size, "cities should have had 2 users"
 
  # assign a post without city_id
  user = create(:city_id => nil)
  
  # then, assign a user using the relationship method
  cities(:rp).users << user
  
  #now, check if city have one more user
  assert_equal 3, cities(:rp).users.size, "city should have had 3 users"
  
  # assign a city to a user that doesn't exist
  user = create(:city_id => 100)
  assert user.errors.invalid?(:city), "city doesn't exist, so it should be required"
end

	# criar dados na tabela User
  private
    def create(options={})
      User.create({
        :name => "Joao",
        :email => "jaumaaa@simpsons.com",
        :login => "jaum",
	:city_id => 1
        }.merge(options))
    end
end
