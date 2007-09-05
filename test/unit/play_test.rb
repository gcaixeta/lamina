require File.dirname(__FILE__) + '/../test_helper'

class PlayTest < Test::Unit::TestCase
  fixtures :plays


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
