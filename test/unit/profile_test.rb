require File.dirname(__FILE__) + '/../test_helper'

class ProfileTest < Test::Unit::TestCase
  fixtures :profiles

  # Replace this with your real tests.
  def test_truth
    assert true
  end
  
  def test_should_require_description
    profile = create(:description => nil)
    assert profile.errors.invalid?(:description), ":description should be required"
    assert_invalid profile, "profile shouldn't be created"
   end

  private
    def create(options={})
      Profile.create({
        :description => "Aluno"
        }.merge(options))
    end


end
