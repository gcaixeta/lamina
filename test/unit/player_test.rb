require File.dirname(__FILE__) + '/../test_helper'

class PlayerTest < Test::Unit::TestCase
  fixtures :players, :games, :groups


  # validar o game_id do player
 def test_should_require_game_id
    player = create(:game_id => nil)
    assert player.errors.invalid?(:game_id), ":game_id should be required"
    assert_invalid player, "player shouldn't be created"
  end

# validar o groups_id do player
 def test_should_require_group_id
    player = create(:group_id => nil)
    assert player.errors.invalid?(:group_id), ":groups_id should be required"
    assert_invalid player, "player shouldn't be created"
  end

	# validar o int no codigo game_id da tabela player
def test_should_deny_non_integer_game_id
  player = create(:game_id => 'a')
  assert player.errors.invalid?(:game_id), ":game_id should have had an error"
  assert_invalid player, "player shouldn't be created"
  
  player = create(:game_id => 1.397)
  assert player.errors.invalid?(:game_id), ":game_id should have had an error"
  assert_invalid player, "player shouldn't be created"
end   


	# validar o int no codigo group_id da tabela player
def test_should_deny_non_integer_groups_id
  player = create(:group_id => 'a')
  assert player.errors.invalid?(:group_id), ":group_id should have had an error"
  assert_invalid player, "player shouldn't be created"
  
  player = create(:group_id => 1.397)
  assert player.errors.invalid?(:group_id), ":group_id should have had an error"
  assert_invalid player, "player shouldn't be created"
end

  def test_should_check_player_game_authorship
 
  # check all fixtures were loaded
  assert_equal 2, games(:game1).players.size, "players should have had 2 games"
  
  # assign a link without game_id
   player = create(:game_id => nil)

  # then, assign a players using the relationship method
  games(:game1).players << player

  #now, check if question_id have one more links
  assert_equal 3, games(:game1).players.size, "players should have had 3 games"


  # assign a proposal to a game_id that doesn't exist
    player = create(:game_id => 100)
    assert player.errors.invalid?(:game), "game_id doesn't exist, so it should be required"

  end


  def test_should_check_player_group_authorship
 
  # check all fixtures were loaded
  assert_equal 2, groups(:group1).players.size, "players should have had 2 groups"
  
  # assign a link without group_id
   player = create(:group_id => nil)

  # then, assign a players using the relationship method
  groups(:group1).players << player

  #now, check if question_id have one more links
  assert_equal 3, groups(:group1).players.size, "players should have had 3 groups"


  # assign a proposal to a group_id that doesn't exist
    player = create(:group_id => 100)
    assert player.errors.invalid?(:group), "group_id doesn't exist, so it should be required"

  end

	# criar dados na tabela Player
  private
    def create(options={})
      Player.create({
	:game_id => 1,
	:group_id => 1
        }.merge(options))
    end

end
