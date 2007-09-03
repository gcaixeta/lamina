require File.dirname(__FILE__) + '/../test_helper'

class CityTest < Test::Unit::TestCase
  fixtures :cities, :states

  # dados com valor nulo
  def test_should_be_invalid
  city = create(:name => nil, :states_id => nil)
  assert_invalid city, "city shouldn't be created"
  end

  #nome da cidade dever estar preenchido
  def test_should_require_title
  city = create(:name => nil)
  assert city.errors.invalid?(:name), ":title should be required"
  assert_invalid city, "city shouldn't be created"
  end

  # o state_id dever ser int
  def test_should_deny_non_integer_state
  city = create(:states_id => 'a')
  assert city.errors.invalid?(:states_id), ":states_id should have had an error"
  assert_invalid city, "city shouldn't be created"
  
  city = create(:states_id => 1.397)
  assert city.errors.invalid?(:states_id), ":states_id should have had an error"
  assert_invalid city, "city shouldn't be created"
  end


def test_should_check_city_authorship
  
  # assign a post without user_id
  city = create(:states_id => nil)
  assert city
 
  # assign a post to a user that doesn't exist
  city = create(:states_id => 100)
  assert city.errors.invalid?(:state), "state doesn't exist, so it should be required"
end

  private
    def create(options={})
      City.create({
        :name => 'Rio Preto',
        :states_id => 1
      }.merge(options))
    end

end
