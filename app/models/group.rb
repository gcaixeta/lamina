class Group < ActiveRecord::Base
has_many :registrations, :through => :participations
belongs_to  :theme
has_many    :players
has_many    :games, :through => :players

validates_presence_of :themes_id
validates_presence_of :name
validates_numericality_of :themes_id, :only_integer => true
end
