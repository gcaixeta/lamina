class Participation < ActiveRecord::Base
belongs_to :registration
belongs_to :group

has_many :messages
has_many :interactions

validates_presence_of :group_id
validates_presence_of :registration_id
validates_presence_of :leader

validates_numericality_of :group_id, :only_integer => true
validates_numericality_of :registration_id, :only_integer => true

validates_presence_of :registration
validates_associated :registration

validates_presence_of :group
validates_associated :group


end
