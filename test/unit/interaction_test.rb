require File.dirname(__FILE__) + '/../test_helper'

class InteractionTest < Test::Unit::TestCase
  fixtures :interactions


     # validar o participations_id do Interaction
 def test_should_require_interaction_id
    interaction = create(:participations_id => nil)
    assert interaction.errors.invalid?(:participations_id), ":participations_id should be required"
    assert_invalid interaction, "interaction shouldn't be created"
  end

     # validar o answers_id do Interaction
 def test_should_require_answers_id
    interaction = create(:answers_id => nil)
    assert interaction.errors.invalid?(:answers_id), ":answers_id should be required"
    assert_invalid interaction, "interaction shouldn't be created"
  end

     # validar o questions_id do Interaction
 def test_should_require_questions_id
    interaction = create(:questions_id => nil)
    assert interaction.errors.invalid?(:questions_id), ":questions_id should be required"
    assert_invalid interaction, "interaction shouldn't be created"
  end

	# validar o int no codigo participations_id da tabela interaction
def test_should_deny_non_integer_participations_id
  interaction = create(:participations_id => 'a')
  assert interaction.errors.invalid?(:participations_id), ":participations_id should have had an error"
  assert_invalid interaction, "interaction shouldn't be created"
  
  interaction = create(:participations_id => 1.397)
  assert interaction.errors.invalid?(:participations_id), ":participations_id should have had an error"
  assert_invalid interaction, "interaction shouldn't be created"
end

	# validar o int no codigo answers_id da tabela interaction
def test_should_deny_non_integer_answers_id
  interaction = create(:answers_id => 'a')
  assert interaction.errors.invalid?(:answers_id), ":answers_id should have had an error"
  assert_invalid interaction, "interaction shouldn't be created"
  
  interaction = create(:answers_id => 1.397)
  assert interaction.errors.invalid?(:answers_id), ":answers_id should have had an error"
  assert_invalid interaction, "interaction shouldn't be created"
end

	# validar o int no codigo questions_id da tabela interaction
def test_should_deny_non_integer_questions_id
  interaction = create(:questions_id => 'a')
  assert interaction.errors.invalid?(:questions_id), ":questions_id should have had an error"
  assert_invalid interaction, "interaction shouldn't be created"
  
  interaction = create(:questions_id => 1.397)
  assert interaction.errors.invalid?(:questions_id), ":questions_id should have had an error"
  assert_invalid interaction, "interaction shouldn't be created"
end


	# criar dados na tabela Interaction
  private
    def create(options={})
      Interaction.create({
	:participations_id => 1,
	:answers_id => 1,
	:questions_id => 1
        }.merge(options))
    end

end
