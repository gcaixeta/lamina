require File.dirname(__FILE__) + '/../test_helper'

class ProposalTest < Test::Unit::TestCase
  fixtures :proposals


     # validar o themes_id do proposal
 def test_should_require_thmes_id
    proposal = create(:themes_id => nil)
    assert proposal.errors.invalid?(:themes_id), ":themes_id should be required"
    assert_invalid proposal, "proposal shouldn't be created"
  end

     # validar o registrations_id do proposal
 def test_should_require_registrations_id
    proposal = create(:registrations_id => nil)
    assert proposal.errors.invalid?(:registrations_id), ":registrations_id should be required"
    assert_invalid proposal, "proposal_id shouldn't be created"
  end

     # validar o active do proposal
 def test_should_require_active
    proposal = create(:active => nil)
    assert proposal.errors.invalid?(:active), ":active should be required"
    assert_invalid proposal, "proposal shouldn't be created"
  end

	# validar o int no themes_id do proposal
def test_should_deny_non_integer_themes_id
  proposal = create(:themes_id => 'a')
  assert proposal.errors.invalid?(:themes_id), ":themes_id should have had an error"
  assert_invalid proposal, "proposal shouldn't be created"
  
  proposal = create(:themes_id => 1.397)
  assert proposal.errors.invalid?(:themes_id), ":themes_id should have had an error"
  assert_invalid proposal, "proposal shouldn't be created"
end


	# validar o int no registrations_id do proposal
def test_should_deny_non_integer_registrations_id
  proposal = create(:registrations_id => 'a')
  assert proposal.errors.invalid?(:registrations_id), ":registrations_id should have had an error"
  assert_invalid proposal, "proposal shouldn't be created"
  
  proposal = create(:registrations_id => 1.397)
  assert proposal.errors.invalid?(:registrations_id), ":registrations_id should have had an error"
  assert_invalid proposal, "proposal shouldn't be created"
end

    def create(options={})
      Proposal.create({
   	:registrations_id => 1,
	:themes_id => 1,
	:active => 1
      }.merge(options))
    end

end
