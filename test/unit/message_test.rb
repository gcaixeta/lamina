require File.dirname(__FILE__) + '/../test_helper'

class MessageTest < Test::Unit::TestCase
  fixtures :messages, :participations


     # validar o messages do message
 def test_should_require_text
    message = create(:messages => nil)
    assert message.errors.invalid?(:messages), ":messages should be required"
    assert_invalid message, "message shouldn't be created"
  end

     # validar o participation_id do message
 def test_should_require_correct
    message = create(:participation_id => nil)
    assert message.errors.invalid?(:participation_id), ":participation_id should be required"
    assert_invalid message, "message shouldn't be created"
  end

	# validar o int do codigo participation_id da tabela message
def test_should_deny_non_integer_questions_id
  message = create(:participation_id => 'a')
  assert message.errors.invalid?(:participation_id), ":participation_id should have had an error"
  assert_invalid message, "message shouldn't be created"
  
  message = create(:participation_id => 1.397)
  assert message.errors.invalid?(:participation_id), ":participation_id should have had an error"
  assert_invalid message, "message shouldn't be created"
end

  def test_should_check_message_group_authorship
 
  # check all fixtures were loaded
  assert_equal 2, participations(:part1).messages.size, "participations should have had 2 messages"
  
  # assign a link without registration_id
   message = create(:participation_id => nil)

  # then, assign a registrations using the relationship method
  participations(:part1).messages << message

  #now, check if messages have one more participations
  assert_equal 3, participations(:part1).messages.size, "participations should have had 3 messages"

  # assign a proposal to a participation_id that doesn't exist
    message = create(:participation_id => 100)
    assert message.errors.invalid?(:participation), "participation doesn't exist, so it should be required"

  end

	# criar dados na tabela Answer
   private
    def create(options={})
      Message.create({
        :participation_id => 1,
    	:messages => "ola" 
        }.merge(options))   
    end

end
