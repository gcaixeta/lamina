require File.dirname(__FILE__) + '/../test_helper'

class PlayerTest < Test::Unit::TestCase
  fixtures :players


  # validar o games_id do player
 def test_should_require_games_id
    player = create(:games_id => nil)
    assert player.errors.invalid?(:games_id), ":games_id should be required"
    assert_invalid player, "player shouldn't be created"
  end

# validar o groups_id do player
 def test_should_require_groups_id
    player = create(:groups_id => nil)
    assert player.errors.invalid?(:groups_id), ":groups_id should be required"
    assert_invalid player, "player shouldn't be created"
  end

	# validar o int no codigo games_id da tabela player
def test_should_deny_non_integer_games_id
  player = create(:games_id => 'a')
  assert player.errors.invalid?(:games_id), ":games_id should have had an error"
  assert_invalid player, "player shouldn't be created"
  
  player = create(:games_id => 1.397)
  assert player.errors.invalid?(:games_id), ":games_id should have had an error"
  assert_invalid player, "player shouldn't be created"
end


	# validar o int no codigo groups_id da tabela player
def test_should_deny_non_integer_groups_id
  player = create(:groups_id => 'a')
  assert player.errors.invalid?(:groups_id), ":groups_id should have had an error"
  assert_invalid player, "player shouldn't be created"
  
  player = create(:groups_id => 1.397)
  assert player.errors.invalid?(:groups_id), ":groups_id should have had an error"
  assert_invalid player, "player shouldn't be created"
end

	# criar dados na tabela Player
  private
    def create(options={})
      Player.create({
	:games_id => 1,
	:groups_id => 1
        }.merge(options))
    end

end
