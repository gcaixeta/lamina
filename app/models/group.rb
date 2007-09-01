class Group < ActiveRecord::Base
has_many :registrations, :through => :participations
belongs_to  :theme
has_many    :players
has_many    :games, :through => :players
end
