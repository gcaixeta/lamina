require File.dirname(__FILE__) + '/../test_helper'

class AnswerTest < Test::Unit::TestCase
  fixtures :answers


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


     # validar o questions_id do answer
 def test_should_require_questions_id
    answer = create(:questions_id => nil)
    assert answer.errors.invalid?(:questions_id), ":questions_id should be required"
    assert_invalid answer, "answer shouldn't be created"
  end

	# validar o int do codigo questions_id da tabela answer
def test_should_deny_non_integer_questions_id
  answer = create(:questions_id => 'a')
  assert answer.errors.invalid?(:questions_id), ":questions_id should have had an error"
  assert_invalid answer, "answer shouldn't be created"
  
  answer = create(:questions_id => 1.397)
  assert answer.errors.invalid?(:questions_id), ":questions_id should have had an error"
  assert_invalid answer, "answer shouldn't be created"
end


	# criar dados na tabela Answer
   private
    def create(options={})
      Answer.create({
        :questions_id => 1,
   	:text => "I have problem",
   	:correct => "true"  
        }.merge(options))   
    end

end
