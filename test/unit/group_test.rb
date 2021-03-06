require File.dirname(__FILE__) + '/../test_helper'

class GroupTest < Test::Unit::TestCase
  fixtures :groups,:themes


     # validar o nome do group
  def test_should_require_name_group
    group = create(:name => nil)
    assert group.errors.invalid?(:name), ":name should be required"
    assert_invalid group, "group shouldn't be created"
  end

     # validar o theme_id do group
  def test_should_require_theme_id_group
    group = create(:theme_id => nil)
    assert group.errors.invalid?(:theme_id), ":theme_id should be required"
    assert_invalid group, "group shouldn't be created"
  end

	# validar o int no theme_id do group
def test_should_deny_non_integer_theme_id
  group = create(:theme_id => 'a')
  assert group.errors.invalid?(:theme_id), ":theme_id should have had an error"
  assert_invalid group, "group shouldn't be created"
  
  group = create(:theme_id => 1.397)
  assert group.errors.invalid?(:theme_id), ":theme_id should have had an error"
  assert_invalid group, "group shouldn't be created"
end


 def test_should_check_groups_authorship
 
  # check all fixtures were loaded
  assert_equal 2, themes(:Paz).groups.size, "themes should have had 2 groups"

  
  # assign a post without themes_id
   group = create(:theme_id => nil)

  # then, assign a groups using the relationship method
  themes(:Paz).groups << group

  #now, check if themes have one more archives
  assert_equal 3, themes(:Paz).groups.size, "themes should have had 3 groups"

  # assign a groups to a theme_id that doesn't exist
    group = create(:theme_id => 100)
    assert group.errors.invalid?(:theme), "theme doesn't exist, so it should be required"

  end

	# criar dados na tabela group
  private
    def create(options={})
      Group.create({
	:theme_id => 1,
	:name => "red"
        }.merge(options))
    end
end
