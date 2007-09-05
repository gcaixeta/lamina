require File.dirname(__FILE__) + '/../test_helper'

class InteractionTest < Test::Unit::TestCase
  fixtures :interactions


     # validar o participation_id do Interaction
 def test_should_require_interaction_id
    interaction = create(:participation_id => nil)
    assert interaction.errors.invalid?(:participation_id), ":participation_id should be required"
    assert_invalid interaction, "interaction shouldn't be created"
  end

     # validar o answers_id do Interaction
 def test_should_require_answer_id
    interaction = create(:answer_id => nil)
    assert interaction.errors.invalid?(:answer_id), ":answer_id should be required"
    assert_invalid interaction, "interaction shouldn't be created"
  end

     # validar o question_id do Interaction
 def test_should_require_question_id
    interaction = create(:question_id => nil)
    assert interaction.errors.invalid?(:question_id), ":question_id should be required"
    assert_invalid interaction, "interaction shouldn't be created"
  end

	# validar o int no codigo participations_id da tabela interaction
def test_should_deny_non_integer_participation_id
  interaction = create(:participation_id => 'a')
  assert interaction.errors.invalid?(:participation_id), ":participation_id should have had an error"
  assert_invalid interaction, "interaction shouldn't be created"
  
  interaction = create(:participation_id => 1.397)
  assert interaction.errors.invalid?(:participation_id), ":participation_id should have had an error"
  assert_invalid interaction, "interaction shouldn't be created"
end

	# validar o int no codigo answer_id da tabela interaction
def test_should_deny_non_integer_answer_id
  interaction = create(:answer_id => 'a')
  assert interaction.errors.invalid?(:answer_id), ":answer_id should have had an error"
  assert_invalid interaction, "interaction shouldn't be created"
  
  interaction = create(:answer_id => 1.397)
  assert interaction.errors.invalid?(:answer_id), ":answer_id should have had an error"
  assert_invalid interaction, "interaction shouldn't be created"
end

	# validar o int no codigo question_id da tabela interaction
def test_should_deny_non_integer_question_id
  interaction = create(:question_id => 'a')
  assert interaction.errors.invalid?(:question_id), ":question_id should have had an error"
  assert_invalid interaction, "interaction shouldn't be created"
  
  interaction = create(:question_id => 1.397)
  assert interaction.errors.invalid?(:question_id), ":question_id should have had an error"
  assert_invalid interaction, "interaction shouldn't be created"
end


	# criar dados na tabela Interaction
  private
    def create(options={})
      Interaction.create({
	:participation_id => 1,
	:answer_id => 1,
	:question_id => 1
        }.merge(options))
    end

end
