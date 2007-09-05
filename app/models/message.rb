class Message < ActiveRecord::Base
belongs_to  :participation

validates_presence_of :messages
validates_presence_of :participation_id

validates_numericality_of :participation_id, :only_integer => true
end
