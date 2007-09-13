require File.dirname(__FILE__) + '/../test_helper'

class ArchiveTest < Test::Unit::TestCase
  fixtures :archives, :themes

     # validar o nome do archive
  def test_should_require_name
    archive = create(:name => nil)
    assert archive.errors.invalid?(:name), ":name should be required"
    assert_invalid archive, "archive shouldn't be created"
  end

     # validar o description do archive
  def test_should_require_description
    archive = create(:description => nil)
    assert archive.errors.invalid?(:description), ":description should be required"
    assert_invalid archive, "archive shouldn't be created"
  end

     # validar o heading do archive
  def test_should_require_heading
    archive = create(:heading => nil)
    assert archive.errors.invalid?(:heading), ":heading should be required"
    assert_invalid archive, "archive shouldn't be created"
  end


     # validar o theme_id do archive
 def test_should_require_theme_id
    archive = create(:theme_id => nil)
    assert archive.errors.invalid?(:theme_id), ":theme_id should be required"
    assert_invalid archive, "archive shouldn't be created"
  end

	# validar o int no theme_id do archive
def test_should_deny_non_integer_theme_id
  archive = create(:theme_id => 'a')
  assert archive.errors.invalid?(:theme_id), ":theme_id should have had an error"
  assert_invalid archive, "archive shouldn't be created"
  
  archive = create(:theme_id => 1.397)
  assert archive.errors.invalid?(:theme_id), ":theme_id should have had an error"
  assert_invalid archive, "archive shouldn't be created"
end

 def test_should_check_archive_authorship
 
  # check all fixtures were loaded
  assert_equal 2, themes(:Paz).archives.size, "themes should have had 2 archives"

  
  # assign a post without themes_id
   archive = create(:theme_id => nil)

  # then, assign a archives using the relationship method
  themes(:Paz).archives << archive

  #now, check if themes have one more archives
  assert_equal 3, themes(:Paz).archives.size, "themes should have had 3 archives"

  # assign a archives to a theme_id that doesn't exist
    archive = create(:theme_id => 100)
    assert archive.errors.invalid?(:theme), "theme doesn't exist, so it should be required"

  end

	# criar dados na tabela archive
  private
    def create(options={})
      Archive.create({
	:theme_id => 1,
	:name => "Imagem do ceu",
	:description => "Photo",
	:heading => "Never"
        }.merge(options))
    end
end
