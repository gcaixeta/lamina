class Theme < ActiveRecord::Base
has_many :proposals
has_many :registrations, :through => :proposals

has_many  :groups
has_many  :games
has_many  :links
has_many  :archives

belongs_to  :configuration
end
