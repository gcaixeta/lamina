class Participation < ActiveRecord::Base
belongs_to :registration
belongs_to :group

has_many :mensagens
has_many :interactions

validates_presence_of :groups_id
validates_presence_of :registrations_id
validates_presence_of :leader

validates_numericality_of :groups_id, :only_integer => true
validates_numericality_of :registrations_id, :only_integer => true

end
