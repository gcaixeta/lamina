require File.dirname(__FILE__) + '/../test_helper'

class PlayTest < Test::Unit::TestCase
  fixtures :plays, :answers, :questions, :players


 # validar o answer_id do play
 def test_should_require_answer_id
    play = create(:answer_id => nil)
    assert play.errors.invalid?(:answer_id), ":answer_id should be required"
    assert_invalid play, "play shouldn't be created"
  end

     # validar o question_id do play
 def test_should_require_question_id
    play = create(:question_id => nil)
    assert play.errors.invalid?(:question_id), ":question_id should be required"
    assert_invalid play, "play shouldn't be created"
  end

 # validar o player_id do play
 def test_should_require_player_id
    play = create(:player_id => nil)
    assert play.errors.invalid?(:player_id), ":player_id should be required"
    assert_invalid play, "play shouldn't be created"
  end

# validar o int no codigo answer_id da tabela play
def test_should_deny_non_integer_answer_id
  play = create(:answer_id => 'a')
  assert play.errors.invalid?(:answer_id), ":answer_id should have had an error"
  assert_invalid play, "play shouldn't be created"
  
  play = create(:answer_id => 1.397)
  assert play.errors.invalid?(:answer_id), ":answer_id should have had an error"
  assert_invalid play, "play shouldn't be created"
end

	# validar o int no codigo question_id da tabela play
def test_should_deny_non_integer_question_id
  play = create(:question_id => 'a')
  assert play.errors.invalid?(:question_id), ":question_id should have had an error"
  assert_invalid play, "play shouldn't be created"
  
  play = create(:question_id => 1.397)
  assert play.errors.invalid?(:question_id), ":question_id should have had an error"
  assert_invalid play, "play shouldn't be created"
end

	# validar o int no codigo player_id da tabela play
def test_should_deny_non_integer_player_id
  play = create(:player_id => 'a')
  assert play.errors.invalid?(:player_id), ":player_id should have had an error"
  assert_invalid play, "play shouldn't be created"
  
  play = create(:player_id => 1.397)
  assert play.errors.invalid?(:player_id), ":player_id should have had an error"
  assert_invalid play, "play shouldn't be created"
end


 def test_should_check_answer_interactions_authorship
 
  # check all fixtures were loaded
   assert_equal 2, answers(:ans1).plays.size, "answer should have had 2 plays"
  
  # assign a link without answer_id
   play = create(:answer_id => nil)

  # then, assign a answer using the relationship method
  answers(:ans1).plays << play

  #now, check if answer have one more participations
  assert_equal 3, answers(:ans1).plays.size, "answer should have had 3 plays"

  # assign a proposal to a answer_id that doesn't exist
    play = create(:answer_id => 100)
    assert play.errors.invalid?(:answer), "answer doesn't exist, so it should be required"

  end

def test_should_check_questions_plays_authorship
 
  # check all fixtures were loaded
  assert_equal 2, questions(:one).plays.size, "questions should have had 2 plays"
  
  # assign a link without questions_id
   play = create(:question_id => nil)

  # then, assign a questions using the relationship method
  questions(:one).plays << play

  #now, check if questions have one more participations
  assert_equal 3, questions(:one).plays.size, "questions should have had 3 plays"

  # assign a proposal to a question_id that doesn't exist
    play = create(:question_id => 100)
    assert play.errors.invalid?(:question), "question doesn't exist, so it should be required"

  end


def test_should_check_players_plays_authorship
 
  # check all fixtures were loaded
  assert_equal 2, players(:one).plays.size, "players should have had 2 plays"
  
  # assign a link without player_id
   play = create(:player_id => nil)

  # then, assign a questions using the relationship method
  players(:one).plays << play

  #now, check if questions have one more participations
  assert_equal 3, players(:one).plays.size, "players should have had 3 plays"

  # assign a proposal to a player_id that doesn't exist
    play = create(:player_id => 100)
    assert play.errors.invalid?(:player), "player doesn't exist, so it should be required"

  end



	# criar dados na tabela Play
  private
    def create(options={})
        Play.create({
	:player_id => 1,
	:answer_id => 1,
	:question_id => 1
        }.merge(options))
    end
end
