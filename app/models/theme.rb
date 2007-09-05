class Theme < ActiveRecord::Base
has_many :proposals
has_many :registrations, :through => :proposals

has_many  :groups
has_many  :games
has_many  :links
has_many  :archives

belongs_to  :configuration

validates_presence_of :name
validates_presence_of :configuration_id
validates_presence_of :summary
validates_presence_of :active
validates_presence_of :password

validates_length_of :password, :minimum => 4
validates_numericality_of :configuration_id, :only_integer => true

end
