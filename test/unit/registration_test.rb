require File.dirname(__FILE__) + '/../test_helper'

class RegistrationTest < Test::Unit::TestCase
  fixtures :registrations, :profiles, :users, :institutions

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

def test_should_check_registration_profiles_authorship
  # check all fixtures were loaded
  assert_equal 6, profiles(:Aluno).registrations.size, "profiles should have had 2 registrations"

  # assign a post without profile_id
   registration = create(:profile_id => nil)
  
  # then, assign a profiles using the relationship method
  profiles(:Aluno).registrations << registration
  
  #now, check if registration have one more profile
  assert_equal 7, profiles(:Aluno).registrations.size, "profiles should have had 3 registrations"

  # assign a registration to a profile that doesn't exist
    registration = create(:profile_id => 100)
    assert registration.errors.invalid?(:profile), "profile doesn't exist, so it should be required"

end

def test_should_check_registration_users_authorship
 
# check all fixtures were loaded
  assert_equal 2, users(:quentin).registrations.size, "users should have had 2 registrations"

  # assign a post without user_id
   registration = create(:user_id => nil)

 # then, assign a users using the relationship method
  users(:quentin).registrations << registration
  
  #now, check if registration have one more users
  assert_equal 3, users(:quentin).registrations.size, "profiles should have had 3 registrations"

  # assign a registration to a profile that doesn't exist
    registration = create(:user_id => 100)
    assert registration.errors.invalid?(:user), "user doesn't exist, so it should be required"

end

def test_should_check_registration_institutions_authorship
 
  # check all fixtures were loaded
  assert_equal 5, institutions(:Fatec).registrations.size, "institutions should have had 2 registrations"

  # assign a post without institution_id
   registration = create(:institution_id => nil)

  # then, assign a institutions using the relationship method
  institutions(:Fatec).registrations << registration
  
  #now, check if registration have one more institutions
  assert_equal 6, institutions(:Fatec).registrations.size, "profiles should have had 3 registrations"

  # assign a registration to a profile that doesn't exist
    registration = create(:institution_id => 100)
    assert registration.errors.invalid?(:institution), "instituition doesn't exist, so it should be required"

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
