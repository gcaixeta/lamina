class Proposal < ActiveRecord::Base
belongs_to :registration
belongs_to :theme

validates_presence_of :theme_id
validates_presence_of :registration_id
validates_presence_of :active

validates_numericality_of :theme_id, :only_integer => true
validates_numericality_of :registration_id, :only_integer => true
end
