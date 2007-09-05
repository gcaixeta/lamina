class Player < ActiveRecord::Base

belongs_to :group
belongs_to :game
has_many :plays


validates_presence_of :game_id
validates_presence_of :group_id


validates_numericality_of :game_id, :only_integer => true
validates_numericality_of :group_id, :only_integer => true

end
