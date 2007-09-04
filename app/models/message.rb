class Message < ActiveRecord::Base
belongs_to  :participation

validates_presence_of :messages
validates_presence_of :participations_id

validates_numericality_of :participations_id, :only_integer => true
end
