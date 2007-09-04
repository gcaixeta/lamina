class Game < ActiveRecord::Base
belongs_to  :theme
has_many    :players
has_many    :groups, :through => :players

validates_presence_of :themes_id
validates_presence_of :date_begin
validates_presence_of :concluded
validates_numericality_of :themes_id, :only_integer => true
end
