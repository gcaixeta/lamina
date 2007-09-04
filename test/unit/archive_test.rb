require File.dirname(__FILE__) + '/../test_helper'

class ArchiveTest < Test::Unit::TestCase
  fixtures :archives

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


     # validar o themes_id do archive
 def test_should_require_thmes_id
    archive = create(:themes_id => nil)
    assert archive.errors.invalid?(:themes_id), ":name should be required"
    assert_invalid archive, "archive shouldn't be created"
  end

	# validar o int no themes_id do archive
def test_should_deny_non_integer_themes_id
  archive = create(:themes_id => 'a')
  assert archive.errors.invalid?(:themes_id), ":themes_id should have had an error"
  assert_invalid archive, "archive shouldn't be created"
  
  archive = create(:themes_id => 1.397)
  assert archive.errors.invalid?(:themes_id), ":themes_id should have had an error"
  assert_invalid archive, "archive shouldn't be created"
end


	# criar dados na tabela archive
  private
    def create(options={})
      Archive.create({
	:themes_id => 1,
	:name => "Imagem do ceu",
	:description => "Photo",
	:heading => "Never"
        }.merge(options))
    end
end
