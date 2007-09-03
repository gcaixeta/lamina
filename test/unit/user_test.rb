require File.dirname(__FILE__) + '/../test_helper'

class UserTest < Test::Unit::TestCase
  fixtures :users

  def test_should_be_invalid
    user = create(:name => nil, :email => nil, :login => nil, :cities_id => 1)
    assert_invalid user, "User shouldn't be created"
  end
  

 def test_should_require_name
    user = create(:name => nil)
    assert user.errors.invalid?(:name), ":name should be required"
    assert_invalid user, "User shouldn't be created"
  end
  

  def test_should_require_cities_id
    user = create(:cities_id => nil)
    assert user.errors.invalid?(:cities_id), ":name should be required"
    assert_invalid user, "User shouldn't be created"
  end


  def test_should_require_email
    user = create(:email => nil)
    assert user.errors.invalid?(:email), ":email should be required"
    assert_invalid user, "User shouldn't be created"
  end
  
  def test_should_deny_bad_email
    user = create(:email => 'bad@format')
    assert user.errors.invalid?(:email), ":email should be in a valid format"
    assert_invalid user, "User shouldn't be created"
  end
 
  def test_should_deny_duplicate_user
    user = create
    assert_valid user
    
    user = create
    assert_invalid user, "User shouldn't be created"
  end
  

  def test_should_deny_non_integer_city
  user = create(:cities_id => 'a')
  assert user.errors.invalid?(:cities_id), ":citis_id should have had an error"
  assert_invalid user, "user shouldn't be created"
  
  user = create(:cities_id => 1.397)
  assert user.errors.invalid?(:cities_id), ":cities_id should have had an error"
  assert_invalid user, "user shouldn't be created"
  end


  private
    def create(options={})
      User.create({
        :name => "Joao",
        :email => "jaumaaa@simpsons.com",
        :login => "jaum",
	:cities_id => 1
        }.merge(options))
    end
end
