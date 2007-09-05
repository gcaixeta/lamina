require File.dirname(__FILE__) + '/../test_helper'

class GroupTest < Test::Unit::TestCase
  fixtures :groups


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

	# criar dados na tabela group
  private
    def create(options={})
      Group.create({
	:theme_id => 1,
	:name => "red"
        }.merge(options))
    end
end
