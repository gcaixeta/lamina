require File.dirname(__FILE__) + '/../test_helper'

class ThemeTest < Test::Unit::TestCase
  fixtures :themes, :configurations

     # validar o nome do theme
 def test_should_require_name
    theme = create(:name => nil)
    assert theme.errors.invalid?(:name), ":name should be required"
    assert_invalid theme, "theme shouldn't be created"
  end

     # validar o summary do theme
 def test_should_require_summary
    theme = create(:summary => nil)
    assert theme.errors.invalid?(:summary), ":summary should be required"
    assert_invalid theme, "theme shouldn't be created"
  end

     # validar o active do theme
 def test_should_require_active
    theme = create(:active => nil)
    assert theme.errors.invalid?(:active), ":active should be required"
    assert_invalid theme, "theme shouldn't be created"
  end


     # validar o password do theme
 def test_should_require_password
    theme = create(:password => nil)
    assert theme.errors.invalid?(:password), ":active should be required"
    assert_invalid theme, "theme shouldn't be created"
  end

     # validar o password no minimo de 4 caracteres do theme
  def test_should_require_longer_password
    theme = create(:password => 't')
    assert theme.errors.invalid?(:password), ":password should be 4 characters or longer"
    assert_invalid theme, "theme shouldn't be created"
  end

     # validar o configuration_id do theme
 def test_should_require_configuration_id
    theme = create(:configuration_id => nil)
    assert theme.errors.invalid?(:configuration_id), ":configuration_id should be required"
    assert_invalid theme, "theme shouldn't be created"
  end

	# validar o int do codigo configuration_id da tabela theme
  def test_should_deny_non_integer_configurations_id
    theme = create(:configuration_id => 'a')
    assert theme.errors.invalid?(:configuration_id), ":configuration_id should have had an error"
    assert_invalid theme, "theme shouldn't be created"
  
    theme = create(:configuration_id => 1.397)
    assert theme.errors.invalid?(:configuration_id), ":configuration_id should have had an error"
    assert_invalid theme, "theme shouldn't be created"
  end

  def test_should_check_registration_configurations_authorship
 
  # check all fixtures were loaded
 # assert_equal 2, configurations(:one).theme.size, "configurations should have had 2 themes"
# erro no theme do model procurar saber como fazer com o relacionamento 1 para 1;
  

  # assign a post without institution_id
   theme = create(:configuration_id => nil)

  # then, assign a institutions using the relationship method
 # configurations(:one).theme << theme # erro no theme do model procurar saber como fazer com o relacionamento 1 para 1;
  
  #now, check if registration have one more institutions
  #assert_equal 3, configurations(:one).themes.size, "profiles should have had 3 registrations"

  # assign a registration to a profile that doesn't exist
    theme = create(:configuration_id => 100)
    assert theme.errors.invalid?(:configuration), "theme doesn't exist, so it should be required"

  end


	# criar dados na tabela theme
  private
    def create(options={})
      Theme.create({
	:configuration_id => 1,
	:name => "War",
	:summary => "War of world",
	:active => 1,
	:password => "123"
        }.merge(options))
    end
end
