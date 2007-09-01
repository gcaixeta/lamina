class Registration < ActiveRecord::Base
belongs_to  :user
belongs_to  :profile
belongs_to  :institution
has_many :participations
has_many :proposals
has_many :themes, :through => :proposals
has_many :groups, :through => :participations
end
