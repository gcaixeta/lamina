class Player < ActiveRecord::Base

belongs_to :group
belongs_to :game
has_many :plays

end
