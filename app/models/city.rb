class City < ActiveRecord::Base
has_many  :users
belongs_to :state

validates_numericality_of :states_id, :only_integer => true
validates_presence_of :name
validates_presence_of :state
validates_associated :state

end
