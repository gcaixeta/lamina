require File.dirname(__FILE__) + '/../test_helper'

class InteractionTest < Test::Unit::TestCase
  fixtures :interactions, :participations, :answers, :questions


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

  def test_should_check_participations_interactions_authorship
 
  # check all fixtures were loaded
  assert_equal 2, participations(:part1).interactions.size, "participations should have had 2 interactions"
  
  # assign a link without participation_id
   interaction = create(:participation_id => nil)

  # then, assign a registrations using the relationship method
  participations(:part1).interactions << interaction

  #now, check if messages have one more participations
  assert_equal 3, participations(:part1).interactions.size, "participations should have had 3 interactions"

  # assign a proposal to a participation_id that doesn't exist
    interaction = create(:participation_id => 100)
    assert interaction.errors.invalid?(:participation), "participation doesn't exist, so it should be required"

  end


  def test_should_check_answer_interactions_authorship
 
  # check all fixtures were loaded
  assert_equal 2, answers(:ans1).interactions.size, "answer should have had 2 interactions"
  
  # assign a link without answer_id
   interaction = create(:answer_id => nil)

  # then, assign a answer using the relationship method
  answers(:ans1).interactions << interaction

  #now, check if answer have one more participations
  assert_equal 3, answers(:ans1).interactions.size, "answer should have had 3 interactions"

  # assign a proposal to a answer_id that doesn't exist
    interaction = create(:answer_id => 100)
    assert interaction.errors.invalid?(:answer), "answer doesn't exist, so it should be required"

  end

  def test_should_check_questions_interactions_authorship
 
  # check all fixtures were loaded
  assert_equal 2, questions(:one).interactions.size, "questions should have had 2 interactions"
  
  # assign a link without questions_id
   interaction = create(:question_id => nil)

  # then, assign a questions using the relationship method
  questions(:one).interactions << interaction

  #now, check if questions have one more participations
  assert_equal 3, questions(:one).interactions.size, "questions should have had 3 interactions"

  # assign a proposal to a question_id that doesn't exist
    interaction = create(:question_id => 100)
    assert interaction.errors.invalid?(:question), "answer doesn't exist, so it should be required"

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
