require File.dirname(__FILE__) + '/../test_helper'

class PlayTest < Test::Unit::TestCase
  fixtures :plays


 # validar o answers_id do play
 def test_should_require_answers_id
    play = create(:answers_id => nil)
    assert play.errors.invalid?(:answers_id), ":answers_id should be required"
    assert_invalid play, "play shouldn't be created"
  end

     # validar o questions_id do play
 def test_should_require_questions_id
    play = create(:questions_id => nil)
    assert play.errors.invalid?(:questions_id), ":questions_id should be required"
    assert_invalid play, "play shouldn't be created"
  end

 # validar o players_id do play
 def test_should_require_players_id
    play = create(:players_id => nil)
    assert play.errors.invalid?(:players_id), ":players_id should be required"
    assert_invalid play, "play shouldn't be created"
  end

	# validar o int no codigo answers_id da tabela play
def test_should_deny_non_integer_answers_id
  play = create(:answers_id => 'a')
  assert play.errors.invalid?(:answers_id), ":answers_id should have had an error"
  assert_invalid play, "play shouldn't be created"
  
  play = create(:answers_id => 1.397)
  assert play.errors.invalid?(:answers_id), ":answers_id should have had an error"
  assert_invalid play, "play shouldn't be created"
end

	# validar o int no codigo questions_id da tabela play
def test_should_deny_non_integer_questions_id
  play = create(:questions_id => 'a')
  assert play.errors.invalid?(:questions_id), ":questions_id should have had an error"
  assert_invalid play, "play shouldn't be created"
  
  play = create(:questions_id => 1.397)
  assert play.errors.invalid?(:questions_id), ":questions_id should have had an error"
  assert_invalid play, "play shouldn't be created"
end

	# validar o int no codigo players_id da tabela play
def test_should_deny_non_integer_players_id
  play = create(:players_id => 'a')
  assert play.errors.invalid?(:players_id), ":players_id should have had an error"
  assert_invalid play, "play shouldn't be created"
  
  play = create(:players_id => 1.397)
  assert play.errors.invalid?(:players_id), ":players_id should have had an error"
  assert_invalid play, "play shouldn't be created"
end


	# criar dados na tabela Play
  private
    def create(options={})
        Play.create({
	:players_id => 1,
	:answers_id => 1,
	:questions_id => 1
        }.merge(options))
    end
end
