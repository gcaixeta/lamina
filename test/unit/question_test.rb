require File.dirname(__FILE__) + '/../test_helper'

class QuestionTest < Test::Unit::TestCase
  fixtures :questions



     # validar o text do Question
 def test_should_require_text
    question = create(:text => nil)
    assert question.errors.invalid?(:text), ":text should be required"
    assert_invalid question, "question shouldn't be created"
  end

	# criar dados na tabela Question
   private
    def create(options={})
      Question.create({
   	:text => "I not"  
        }.merge(options))   
    end

end
