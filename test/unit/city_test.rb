require File.dirname(__FILE__) + '/../test_helper'

class CityTest < Test::Unit::TestCase
  fixtures :cities, :states

  # dados com valor nulo
  def test_should_be_invalid
  city = create(:name => nil, :state_id => nil)
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
  city = create(:state_id => 'a')
  assert city.errors.invalid?(:state_id), ":state_id should have had an error"
  assert_invalid city, "city shouldn't be created"
  
  city = create(:state_id => 1.397)
  assert city.errors.invalid?(:state_id), ":state_id should have had an error"
  assert_invalid city, "city shouldn't be created"
  end

def test_should_check_city_authorship
  # check all fixtures were loaded
  assert_equal 2, states(:sp).cities.size, "states should have had 2 cities"
 
  # assign a post without state_id
  city = create(:state_id => nil)
  
  # then, assign a post using the relationship method
  states(:sp).cities << city
  
  #now, check if user have one more post
  assert_equal 3, states(:sp).cities.size, "user should have had 3 posts"
  
  # assign a post to a user that doesn't exist
  city = create(:state_id => 100)
  assert city.errors.invalid?(:state), "User doesn't exist, so it should be required"
end

  private
    def create(options={})
      City.create({
        :name => 'Rio Preto',
        :state_id => 1
      }.merge(options))
    end

end
