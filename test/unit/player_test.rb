require File.dirname(__FILE__) + '/../test_helper'

class PlayerTest < Test::Unit::TestCase
  fixtures :players


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

	# criar dados na tabela Player
  private
    def create(options={})
      Player.create({
	:game_id => 1,
	:group_id => 1
        }.merge(options))
    end

end
