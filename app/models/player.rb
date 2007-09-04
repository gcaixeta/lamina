class Player < ActiveRecord::Base

belongs_to :group
belongs_to :game
has_many :plays


validates_presence_of :games_id
validates_presence_of :groups_id


validates_numericality_of :games_id, :only_integer => true
validates_numericality_of :groups_id, :only_integer => true

end
