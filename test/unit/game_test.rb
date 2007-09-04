require File.dirname(__FILE__) + '/../test_helper'

class GameTest < Test::Unit::TestCase
  fixtures :games


	# Proibi criacao dados em branco
def test_should_be_invalid
  game = create(:themes_id => nil, :date_begin => nil, 
      :concluded => nil)
  assert_invalid game, "Game shouldn't be created"
end

     # validar o themes_id do game
 def test_should_require_themes_id
    game = create(:themes_id => nil)
    assert game.errors.invalid?(:themes_id), ":themes_id should be required"
    assert_invalid game, "game shouldn't be created"
  end

     # validar o date_begin  do game
 def test_should_require_date_begin
    game = create(:date_begin  => nil)
    assert game.errors.invalid?(:date_begin ), ":date_begin  should be required"
    assert_invalid game, "game shouldn't be created"
  end

     # validar o concluded  do game
 def test_should_require_concluded
    game = create(:concluded  => nil)
    assert game.errors.invalid?(:concluded ), ":concluded  should be required"
    assert_invalid game, "game shouldn't be created"
  end


	# validar o int no themes_id do game
def test_should_deny_non_integer_themes_id
  game = create(:themes_id => 'a')
  assert game.errors.invalid?(:themes_id), ":themes_id should have had an error"
  assert_invalid game, "game shouldn't be created"
  
  game = create(:themes_id => 1.397)
  assert game.errors.invalid?(:themes_id), ":themes_id should have had an error"
  assert_invalid game, "game shouldn't be created"
end

	# criar dados na tabela Game
  private
    def create(options={})
      Game.create({
	:themes_id => 1,
	:date_begin => "10-10-2000",
	:concluded => "true"
        }.merge(options))
    end
end
