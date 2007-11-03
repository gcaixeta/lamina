class Interaction < ActiveRecord::Base
belongs_to  :participation
belongs_to :activity

validates_presence_of :participation_id


validates_numericality_of :participation_id, :only_integer => true


validates_presence_of :participation
validates_associated :participation

end
