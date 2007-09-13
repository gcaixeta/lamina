require File.dirname(__FILE__) + '/../test_helper'

class GameTest < Test::Unit::TestCase
  fixtures :games, :themes


	# Proibi criacao dados em branco
def test_should_be_invalid
  game = create(:theme_id => nil, :date_begin => nil, 
      :concluded => nil)
  assert_invalid game, "Game shouldn't be created"
end

     # validar o theme_id do game
 def test_should_require_theme_id
    game = create(:theme_id => nil)
    assert game.errors.invalid?(:theme_id), ":theme_id should be required"
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


	# validar o int no theme_id do game
def test_should_deny_non_integer_theme_id
  game = create(:theme_id => 'a')
  assert game.errors.invalid?(:theme_id), ":theme_id should have had an error"
  assert_invalid game, "game shouldn't be created"
  
  game = create(:theme_id => 1.397)
  assert game.errors.invalid?(:theme_id), ":theme_id should have had an error"
  assert_invalid game, "game shouldn't be created"
end


 def test_should_check_games_authorship
 
  # check all fixtures were loaded
  assert_equal 2, themes(:Paz).games.size, "themes should have had 2 games"

  
  # assign a post without themes_id
   game = create(:theme_id => nil)

  # then, assign a games using the relationship method
  themes(:Paz).games << game

  #now, check if themes have one more archives
  assert_equal 3, themes(:Paz).games.size, "themes should have had 3 games"

  # assign a games to a theme_id that doesn't exist
    game = create(:theme_id => 100)
    assert game.errors.invalid?(:theme), "theme doesn't exist, so it should be required"

  end


	# criar dados na tabela Game
  private
    def create(options={})
      Game.create({
	:theme_id => 1,
	:date_begin => "10-10-2000",
	:concluded => "true"
        }.merge(options))
    end
end
