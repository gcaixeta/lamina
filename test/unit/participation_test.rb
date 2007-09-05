require File.dirname(__FILE__) + '/../test_helper'

class ParticipationTest < Test::Unit::TestCase
  fixtures :participations


     # validar o group_id do participation
 def test_should_require_group_id
    participation = create(:group_id => nil)
    assert participation.errors.invalid?(:group_id), ":group_id should be required"
    assert_invalid participation, "theme shouldn't be created"
  end

     # validar o registration_id do participation
 def test_should_require_registration_id
    participation = create(:registration_id => nil)
    assert participation.errors.invalid?(:registration_id), ":registration_id should be required"
    assert_invalid participation, "theme shouldn't be created"
  end

     # validar o leader do participation
 def test_should_require_leader
    participation = create(:leader => nil)
    assert participation.errors.invalid?(:leader), "leader should be required"
    assert_invalid participation, "theme shouldn't be created"
  end


	# criar dados na tabela theme
  private
    def create(options={})
      Participation.create({
	:group_id => 1,
        :registration_id => 1, 
   	:leader => "true"
        }.merge(options))
    end

end
