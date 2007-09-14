require File.dirname(__FILE__) + '/../test_helper'

class AnswerTest < Test::Unit::TestCase
  fixtures :answers, :questions


     # validar o text do answer
 def test_should_require_text
    answer = create(:text => nil)
    assert answer.errors.invalid?(:text), ":text should be required"
    assert_invalid answer, "answer shouldn't be created"
  end

     # validar o correct do answer
 def test_should_require_correct
    answer = create(:correct => nil)
    assert answer.errors.invalid?(:correct), ":correct should be required"
    assert_invalid answer, "answer shouldn't be created"
  end


     # validar o question_id do answer
 def test_should_require_question_id
    answer = create(:question_id => nil)
    assert answer.errors.invalid?(:question_id), ":question_id should be required"
    assert_invalid answer, "answer shouldn't be created"
  end

	# validar o int do codigo question_id da tabela answer
def test_should_deny_non_integer_question_id
  answer = create(:question_id => 'a')
  assert answer.errors.invalid?(:question_id), ":question_id should have had an error"
  assert_invalid answer, "answer shouldn't be created"
  
  answer = create(:question_id => 1.397)
  assert answer.errors.invalid?(:question_id), ":question_id should have had an error"
  assert_invalid answer, "answer shouldn't be created"
end

  def test_should_check_questions_authorship
 
  # check all fixtures were loaded
  assert_equal 2, questions(:one).answers.size, "answers should have had 2 question"
  
  # assign a link without question_id
   answer = create(:question_id => nil)

  # then, assign a answers using the relationship method
  questions(:one).answers << answer

  #now, check if question_id have one more links
  assert_equal 3, questions(:one).answers.size, "answers should have had 3 questions"

  # assign a proposal to a question_id that doesn't exist
    answer = create(:question_id => 100)
    assert answer.errors.invalid?(:question), "question_id doesn't exist, so it should be required"

  end
  
	# criar dados na tabela Answer
   private
    def create(options={})
      Answer.create({
        :question_id => 1,
		:text => "I have problem",
		:correct => "true"  
        }.merge(options))   
    end

end
