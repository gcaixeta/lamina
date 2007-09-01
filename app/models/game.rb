class Game < ActiveRecord::Base
belongs_to  :theme
has_many    :players
has_many    :groups, :through => :players
end
