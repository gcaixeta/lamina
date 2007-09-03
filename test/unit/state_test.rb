require File.dirname(__FILE__) + '/../test_helper'

class StateTest < Test::Unit::TestCase
  fixtures :states


  # validar o nome do state
  def test_should_require_name
   state = create(:name => nil)
   assert state.errors.invalid?(:name), ":name should be required"
   assert_invalid state, "state shouldn't be created"
  end


  # Criar dados do State
  private
    def create(options={})
      State.create({
        :name => "Sao Paulo"
        }.merge(options))
    end




end
