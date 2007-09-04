require File.dirname(__FILE__) + '/../test_helper'

class RegistrationTest < Test::Unit::TestCase
  fixtures :registrations

     # validar o profiles_id do registration
  def test_should_require_profiles_id
   registration = create(:profiles_id => nil)
   assert registration.errors.invalid?(:profiles_id), ":profiles_id should be required"
   assert_invalid registration, "registration shouldn't be created"
  end

    # validar o users_id do registration
  def test_should_require_users_id
   registration = create(:users_id => nil)
   assert registration.errors.invalid?(:users_id), ":users_id should be required"
   assert_invalid registration, "registration shouldn't be created"
  end

   # validar o institutions_id do registration
  def test_should_require_institutions_id
   registration = create(:institutions_id => nil)
   assert registration.errors.invalid?(:institutions_id), ":institutions_id should be required"
   assert_invalid registration, "registration shouldn't be created"
  end


	# validar o int do codigo profiles_id da tabela registration
  def test_should_deny_non_integer_profiles_id
    registration = create(:profiles_id => 'a')
    assert registration.errors.invalid?(:profiles_id), ":profiles_id should have had an error"
    assert_invalid registration, "registration shouldn't be created"
  
    registration = create(:profiles_id => 1.397)
    assert registration.errors.invalid?(:profiles_id), ":profiles_id should have had an error"
    assert_invalid registration, "registration shouldn't be created"
  end

	# validar o int do codigo users_id da tabela registration
  def test_should_deny_non_integer_users_id
    registration = create(:users_id => 'a')
    assert registration.errors.invalid?(:users_id), ":user_id should have had an error"
    assert_invalid registration, "registration shouldn't be created"
  
    registration = create(:users_id => 1.397)
    assert registration.errors.invalid?(:users_id), ":user_id should have had an error"
    assert_invalid registration, "registration shouldn't be created"
  end

	# validar o int do codigo institutions_id da tabela registration
  def test_should_deny_non_integer_institutions_id
    registration = create(:institutions_id => 'a')
    assert registration.errors.invalid?(:institutions_id), ":institutions_id should have had an error"
    assert_invalid registration, "registration shouldn't be created"
  
    registration = create(:institutions_id => 1.397)
    assert registration.errors.invalid?(:institutions_id), ":institutions_id should have had an error"
    assert_invalid registration, "registration shouldn't be created"
  end

	# criar dados na tabela Registration
    def create(options={})
      Registration.create({
   	:profiles_id => 1,
	:users_id => 1,
	:institutions_id => 1
      }.merge(options))
    end

end
