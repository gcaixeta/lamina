require File.dirname(__FILE__) + '/../test_helper'

class ProposalTest < Test::Unit::TestCase
  fixtures :proposals


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
 def test_should_require_active
    proposal = create(:active => nil)
    assert proposal.errors.invalid?(:active), ":active should be required"
    assert_invalid proposal, "proposal shouldn't be created"
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

    def create(options={})
      Proposal.create({
   	:registration_id => 1,
	:theme_id => 1,
	:active => 1
      }.merge(options))
    end

end
