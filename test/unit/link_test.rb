require File.dirname(__FILE__) + '/../test_helper'

class LinkTest < Test::Unit::TestCase
  fixtures :links


	# Proibi criacao dados em branco
  def test_should_be_invalid
  link = create(:themes_id => nil, :address => nil, :description => nil)
  assert_invalid link, "Link shouldn't be created"
  end


     # validar o description do link
  def test_should_require_description
    link = create(:description => nil)
    assert link.errors.invalid?(:description), ":description should be required"
    assert_invalid link, "link shouldn't be created"
  end


     # validar o themes_id do link
 def test_should_require_thmes_id
    link = create(:themes_id => nil)
    assert link.errors.invalid?(:themes_id), ":name should be required"
    assert_invalid link, "link shouldn't be created"
  end

	# validar o int no themes_id do link
def test_should_deny_non_integer_themes_id
  link = create(:themes_id => 'a')
  assert link.errors.invalid?(:themes_id), ":themes_id should have had an error"
  assert_invalid link, "link shouldn't be created"
  
  link = create(:themes_id => 1.397)
  assert link.errors.invalid?(:themes_id), ":themes_id should have had an error"
  assert_invalid link, "link shouldn't be created"
end



	# criar dados na tabela links
  private
    def create(options={})
      Link.create({
	:themes_id => 1,
	:address => "www.uol.com.br/tecnologia",
	:description => "Photo"
        }.merge(options))
    end

end
