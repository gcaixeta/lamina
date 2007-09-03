require File.dirname(__FILE__) + '/../test_helper'

class GroupTest < Test::Unit::TestCase
  fixtures :groups

  # Replace this with your real tests.
  def test_truth
    assert true
  end


     # validar o nome do gruop
  def test_should_require_name
    gruop = create(:name => nil)
    assert gruop.errors.invalid?(:name), ":name should be required"
    assert_invalid gruop, "gruop shouldn't be created"
  end


	# criar dados na tabela archive
  private
    def create(options={})
      Gruop.create({
	:themes_id => 1,
	:name => "red"
        }.merge(options))
    end
end
