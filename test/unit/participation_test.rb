require File.dirname(__FILE__) + '/../test_helper'

class ParticipationTest < Test::Unit::TestCase
  fixtures :participations, :registrations,:groups


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



  def test_should_check_proposal_Participation_authorship
 
  # check all fixtures were loaded
  assert_equal 2, registrations(:one).participations.size, "registration should have had 2 participations"

  
  # assign a link without registration_id
   participation = create(:registration_id => nil)

  # then, assign a registrations using the relationship method
  registrations(:one).participations << participation

  #now, check if registration have one more links
  assert_equal 3, registrations(:one).participations.size, "registration should have had 3 proposals"

  # assign a proposal to a registration_id that doesn't exist
    participation = create(:registration_id => 100)
    assert participation.errors.invalid?(:registration), "registration doesn't exist, so it should be required"

  end


  def test_should_check_proposal_Participation_group_authorship
 
  # check all fixtures were loaded
  assert_equal 2, groups(:group1).participations.size, "registration should have had 2 group"
  
  # assign a link without registration_id
   participation = create(:group_id => nil)

  # then, assign a registrations using the relationship method
  groups(:group1).participations << participation

  #now, check if registration have one more links
  assert_equal 3, groups(:group1).participations.size, "registration should have had 3 proposals"

  # assign a proposal to a registration_id that doesn't exist
    participation = create(:group_id => 100)
    assert participation.errors.invalid?(:group), "registration doesn't exist, so it should be required"

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
