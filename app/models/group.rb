class Group < ActiveRecord::Base
has_many :registrations, :through => :participations
has_many :participations
belongs_to  :theme
has_many    :players
has_many    :games, :through => :players

validates_presence_of :theme_id
validates_presence_of :name
validates_numericality_of :theme_id, :only_integer => true

  validates_presence_of :theme
  validates_associated :theme




end
