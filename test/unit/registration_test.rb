require File.dirname(__FILE__) + '/../test_helper'

class RegistrationTest < Test::Unit::TestCase
  fixtures :registrations

     # validar o profile_id do registration
  def test_should_require_profile_id
   registration = create(:profile_id => nil)
   assert registration.errors.invalid?(:profile_id), ":profile_id should be required"
   assert_invalid registration, "registration shouldn't be created"
  end

    # validar o user_id do registration
  def test_should_require_user_id
   registration = create(:user_id => nil)
   assert registration.errors.invalid?(:user_id), ":user_id should be required"
   assert_invalid registration, "registration shouldn't be created"
  end

   # validar o institution_id do registration
  def test_should_require_institution_id
   registration = create(:institution_id => nil)
   assert registration.errors.invalid?(:institution_id), ":institution_id should be required"
   assert_invalid registration, "registration shouldn't be created"
  end


	# validar o int do codigo profile_id da tabela registration
  def test_should_deny_non_integer_profile_id
    registration = create(:profile_id => 'a')
    assert registration.errors.invalid?(:profile_id), ":profile_id should have had an error"
    assert_invalid registration, "registration shouldn't be created"
  
    registration = create(:profile_id => 1.397)
    assert registration.errors.invalid?(:profile_id), ":profile_id should have had an error"
    assert_invalid registration, "registration shouldn't be created"
  end

	# validar o int do codigo user_id da tabela registration
  def test_should_deny_non_integer_user_id
    registration = create(:user_id => 'a')
    assert registration.errors.invalid?(:user_id), ":user_id should have had an error"
    assert_invalid registration, "registration shouldn't be created"
  
    registration = create(:user_id => 1.397)
    assert registration.errors.invalid?(:user_id), ":user_id should have had an error"
    assert_invalid registration, "registration shouldn't be created"
  end

	# validar o int do codigo institution_id da tabela registration
  def test_should_deny_non_integer_institution_id
    registration = create(:institution_id => 'a')
    assert registration.errors.invalid?(:institution_id), ":institution_id should have had an error"
    assert_invalid registration, "registration shouldn't be created"
  
    registration = create(:institution_id => 1.397)
    assert registration.errors.invalid?(:institution_id), ":institution_id should have had an error"
    assert_invalid registration, "registration shouldn't be created"
  end

	# criar dados na tabela Registration
    def create(options={})
      Registration.create({
   	:profile_id => 1,
	:user_id => 1,
	:institution_id => 1
      }.merge(options))
    end

end
