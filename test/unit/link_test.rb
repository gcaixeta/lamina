require File.dirname(__FILE__) + '/../test_helper'

class LinkTest < Test::Unit::TestCase
  fixtures :links, :themes


	# Proibi criacao dados em branco
  def test_should_be_invalid
  link = create(:theme_id => nil, :address => nil, :description => nil)
  assert_invalid link, "Link shouldn't be created"
  end


     # validar o description do link
  def test_should_require_description
    link = create(:description => nil)
    assert link.errors.invalid?(:description), ":description should be required"
    assert_invalid link, "link shouldn't be created"
  end


     # validar o theme_id do link
 def test_should_require_thme_id
    link = create(:theme_id => nil)
    assert link.errors.invalid?(:theme_id), ":theme_id  should be required"
    assert_invalid link, "link shouldn't be created"
  end

	# validar o int no theme_id do link
def test_should_deny_non_integer_themes_id
  link = create(:theme_id => 'a')
  assert link.errors.invalid?(:theme_id), ":theme_id should have had an error"
  assert_invalid link, "link shouldn't be created"
  
  link = create(:theme_id => 1.397)
  assert link.errors.invalid?(:theme_id), ":theme_id should have had an error"
  assert_invalid link, "link shouldn't be created"
end


  def test_should_check_link_authorship
 
  # check all fixtures were loaded
  assert_equal 2, themes(:Paz).links.size, "themes should have had 2 links"

  
  # assign a link without theme_id
   link = create(:theme_id => nil)

  # then, assign a themes using the relationship method
  themes(:Paz).links << link

  #now, check if themes have one more links
  assert_equal 3, themes(:Paz).links.size, "themes should have had 3 links"

  # assign a link to a theme_id that doesn't exist
    link = create(:theme_id => 100)
    assert link.errors.invalid?(:theme), "theme doesn't exist, so it should be required"

  end

	# criar dados na tabela links
  private
    def create(options={})
      Link.create({
	:theme_id => 1,
	:address => "www.uol.com.br/tecnologia",
	:description => "Photo"
        }.merge(options))
    end

end
