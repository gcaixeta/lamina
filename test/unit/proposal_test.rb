require File.dirname(__FILE__) + '/../test_helper'

class ProposalTest < Test::Unit::TestCase
  fixtures :proposals, :themes, :registrations


     # validar o theme_id do proposal
 def test_should_require_theme_id
    proposal = create(:theme_id => nil)
    assert proposal.errors.invalid?(:theme_id), ":theme_id should be required"
    assert_invalid proposal, "proposal shouldn't be created"
  end

     # validar o registration_id do proposal
 def test_should_require_registration_id
    proposal = create(:registration_id => nil)
    assert proposal.errors.invalid?(:registration_id), ":registration_id should be required"
    assert_invalid proposal, "proposal_id shouldn't be created"
  end

     # validar o active do proposal

 def test_should_not_require_active
    proposal = create(:active => nil)
    assert proposal, "proposal should be created"
  end

	# validar o int no theme_id do proposal
def test_should_deny_non_integer_theme_id
  proposal = create(:theme_id => 'a')
  assert proposal.errors.invalid?(:theme_id), ":theme_id should have had an error"
  assert_invalid proposal, "proposal shouldn't be created"
  
  proposal = create(:theme_id => 1.397)
  assert proposal.errors.invalid?(:theme_id), ":theme_id should have had an error"
  assert_invalid proposal, "proposal shouldn't be created"
end


	# validar o int no registration_id do proposal
def test_should_deny_non_integer_registration_id
  proposal = create(:registration_id => 'a')
  assert proposal.errors.invalid?(:registration_id), ":registration_id should have had an error"
  assert_invalid proposal, "proposal shouldn't be created"
  
  proposal = create(:registration_id => 1.397)
  assert proposal.errors.invalid?(:registration_id), ":registration_id should have had an error"
  assert_invalid proposal, "proposal shouldn't be created"
end

  def test_should_check_proposal_authorship
 
  # check all fixtures were loaded
  assert_equal 2, themes(:Paz).proposals.size, "themes should have had 2 proposals"

  
  # assign a link without theme_id
   proposal = create(:theme_id => nil)

  # then, assign a themes using the relationship method
  themes(:Paz).proposals << proposal

  #now, check if themes have one more links
  assert_equal 3, themes(:Paz).proposals.size, "themes should have had 3 proposals"

  # assign a proposal to a theme_id that doesn't exist
    proposal = create(:theme_id => 100)
    assert proposal.errors.invalid?(:theme), "theme doesn't exist, so it should be required"

  end

  def test_should_check_proposal_registration_authorship
 
  # check all fixtures were loaded
  assert_equal 3, registrations(:reg5).proposals.size, "registration should have had 3 proposals"

  
  # assign a link without registration_id
   proposal = create(:registration_id => nil)

  # then, assign a registrations using the relationship method
  registrations(:reg5).proposals << proposal

  #now, check if registration have one more links
  assert_equal 4, registrations(:reg5).proposals.size, "registration should have had 4 proposals"

  # assign a proposal to a registration_id that doesn't exist
    proposal = create(:registration_id => 100)
    assert proposal.errors.invalid?(:registration), "registration doesn't exist, so it should be required"

  end

    def create(options={})
      Proposal.create({
   	:registration_id => 1,
	:theme_id => 1,
	:active => 1
      }.merge(options))
    end

end
