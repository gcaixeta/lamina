require File.dirname(__FILE__) + '/../test_helper'

class UserTest < Test::Unit::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead.
  # Then, you can remove it from this and the functional test.
  include AuthenticatedTestHelper
  fixtures :users, :cities

  def test_should_be_invalid
    user = create_user(:name => nil, :email => nil, :login => nil, :city_id => 1)
    assert_invalid user, "User shouldn't be created"
  end
  
     # validar o name do user
 def test_should_require_name
    user = create_user(:name => nil)
    assert user.errors.invalid?(:name), ":name should be required"
    assert_invalid user, "User shouldn't be created"
  end
  
    # validar o city_id do user
  def test_should_require_city_id
    user = create_user(:city_id => nil)
    assert user.errors.invalid?(:city_id), ":city_id should be required"
    assert_invalid user, "User shouldn't be created"
  end

   # validar o email do user
  def test_should_require_email
    user = create_user(:email => nil)
    assert user.errors.invalid?(:email), ":email should be required"
    assert_invalid user, "User shouldn't be created"
  end
  
   # validar o formato do email do user
  def test_should_deny_bad_email
    user = create_user(:email => 'bad@format')
    assert user.errors.invalid?(:email), ":email should be in a valid format"
    assert_invalid user, "User shouldn't be created"
  end

   # nao permite a criacao duplicada de usuario
  def test_should_deny_duplicate_user
    user = create_user
    assert_valid user
    
    user = create_user
    assert_invalid user, "User shouldn't be created"
  end
  
	# validar o int do codigo city_id da tabela user
  def test_should_deny_non_integer_city
  user = create_user(:city_id => 'a')
  assert user.errors.invalid?(:city_id), ":city_id should have had an error"
  assert_invalid user, "user shouldn't be created"
  
  user = create_user(:city_id => 1.397)
  assert user.errors.invalid?(:city_id), ":city_id should have had an error"
  assert_invalid user, "user shouldn't be created"
  end

def test_should_check_user_authorship
  # check all fixtures were loaded
  assert_equal 4, cities(:rp).users.size, "cities should have had 2 users"
 
  # assign a post without city_id
  user = create_user(:city_id => nil)
  
  # then, assign a user using the relationship method
  cities(:rp).users << user
  
  #now, check if city have one more user
  assert_equal 5, cities(:rp).users.size, "city should have had 3 users"
  
  # assign a city to a user that doesn't exist
  user = create_user(:city_id => 100)
  assert user.errors.invalid?(:city), "city doesn't exist, so it should be required"
end

  def test_should_create_user
    assert_difference 'User.count' do
      user = create_user
      assert !user.new_record?, "#{user.errors.full_messages.to_sentence}"
    end
  end

  def test_should_require_login
    assert_no_difference 'User.count' do
      u = create_user(:login => nil)
      assert u.errors.on(:login)
    end
  end

  def test_should_require_password
    assert_no_difference 'User.count' do
      u = create_user(:password => nil)
      assert u.errors.on(:password)
    end
  end

  def test_should_require_password_confirmation
    assert_no_difference 'User.count' do
      u = create_user(:password_confirmation => nil)
      assert u.errors.on(:password_confirmation)
    end
  end

  def test_should_require_email
    assert_no_difference 'User.count' do
      u = create_user(:email => nil)
      assert u.errors.on(:email)
    end
  end

  def test_should_reset_password
    users(:quentin).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    assert_equal users(:quentin), User.authenticate('quentin', 'new password')
  end

  def test_should_not_rehash_password
    users(:quentin).update_attributes(:login => 'quentin2')
    assert_equal users(:quentin), User.authenticate('quentin2', 'test')
  end

  def test_should_authenticate_user
    assert_equal users(:quentin), User.authenticate('quentin', 'test')
  end

  def test_should_set_remember_token
    users(:quentin).remember_me
    assert_not_nil users(:quentin).remember_token
    assert_not_nil users(:quentin).remember_token_expires_at
  end

  def test_should_unset_remember_token
    users(:quentin).remember_me
    assert_not_nil users(:quentin).remember_token
    users(:quentin).forget_me
    assert_nil users(:quentin).remember_token
  end

  def test_should_remember_me_for_one_week
    before = 1.week.from_now.utc
    users(:quentin).remember_me_for 1.week
    after = 1.week.from_now.utc
    assert_not_nil users(:quentin).remember_token
    assert_not_nil users(:quentin).remember_token_expires_at
    assert users(:quentin).remember_token_expires_at.between?(before, after)
  end

  def test_should_remember_me_until_one_week
    time = 1.week.from_now.utc
    users(:quentin).remember_me_until time
    assert_not_nil users(:quentin).remember_token
    assert_not_nil users(:quentin).remember_token_expires_at
    assert_equal users(:quentin).remember_token_expires_at, time
  end

  def test_should_remember_me_default_two_weeks
    before = 2.weeks.from_now.utc
    users(:quentin).remember_me
    after = 2.weeks.from_now.utc
    assert_not_nil users(:quentin).remember_token
    assert_not_nil users(:quentin).remember_token_expires_at
    assert users(:quentin).remember_token_expires_at.between?(before, after)
  end


  protected

    def create_user(options = {})
      User.create({ 
        :login => 'quire', 
			  :name => "Joao",
        :email => 'quire@example.com', 
        :password => 'quire', 
        :password_confirmation => 'quire', 
      	:city_id => 1
        }.merge(options))
    end


end
