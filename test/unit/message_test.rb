require File.dirname(__FILE__) + '/../test_helper'

class MessageTest < Test::Unit::TestCase
  fixtures :messages


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



	# criar dados na tabela Answer
   private
    def create(options={})
      Message.create({
        :participation_id => 1,
    	:messages => "ola" 
        }.merge(options))   
    end

end
