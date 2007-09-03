require File.dirname(__FILE__) + '/../test_helper'

class ConfigurationTest < Test::Unit::TestCase
  fixtures :configurations


  # validar o number_participants da configurations
  def test_should_require_number_participants
   configuration = create(:number_participants => nil)
   assert configuration.errors.invalid?(:number_participants), ":number_participants should be required"
   assert_invalid configuration, "configuration shouldn't be created"
  end


  # validar o questions_max da configurations
  def test_should_require_questions_max
   configuration = create(:questions_max => nil)
   assert configuration.errors.invalid?(:questions_max), ":number_participants should be required"
   assert_invalid configuration, "configuration shouldn't be created"
  end


  # Criar dados da configurations
  private
    def create(options={})
      Configuration.create({
        :number_participants => 10,
	:questions_max => 10
        }.merge(options))
    end

end
