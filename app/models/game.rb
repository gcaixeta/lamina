class Game < ActiveRecord::Base
belongs_to  :theme
has_many    :players
has_many    :groups, :through => :players

validates_presence_of :theme_id
validates_presence_of :date_begin
validates_presence_of :concluded
validates_numericality_of :theme_id, :only_integer => true
end
