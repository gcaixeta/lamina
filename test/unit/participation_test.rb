require File.dirname(__FILE__) + '/../test_helper'

class ParticipationTest < Test::Unit::TestCase
  fixtures :participations


     # validar o groups_id do participation
 def test_should_require_groups_id
    participation = create(:groups_id => nil)
    assert participation.errors.invalid?(:groups_id), ":groups_id should be required"
    assert_invalid participation, "theme shouldn't be created"
  end

     # validar o registrations_id do participation
 def test_should_require_registrations_id
    participation = create(:registrations_id => nil)
    assert participation.errors.invalid?(:registrations_id), ":registrations_id should be required"
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
	:groups_id => 1,
        :registrations_id => 1, 
   	:leader => "true"
        }.merge(options))
    end

end
