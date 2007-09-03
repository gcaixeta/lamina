class Proposal < ActiveRecord::Base
belongs_to :registration
belongs_to :theme

validates_presence_of :themes_id
validates_presence_of :registrations_id
validates_presence_of :active

validates_numericality_of :themes_id, :only_integer => true
validates_numericality_of :registrations_id, :only_integer => true
end
