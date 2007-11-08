class Activity < ActiveRecord::Base
# p.activities.create(:creation => q)

belongs_to  :participation

belongs_to :creation, :polymorphic => true


has_many :interactions
has_many :observations
validates_presence_of :participation_id


validates_numericality_of :participation_id, :only_integer => true


validates_presence_of :participation
validates_associated :participation

end
