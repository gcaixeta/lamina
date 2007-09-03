class Registration < ActiveRecord::Base
belongs_to  :user
belongs_to  :profile
belongs_to  :institution
has_many :participations
has_many :proposals
has_many :themes, :through => :proposals
has_many :groups, :through => :participations


  validates_presence_of :profiles_id
  validates_presence_of :users_id
  validates_presence_of :institutions_id


validates_numericality_of :profiles_id, :only_integer => true
validates_numericality_of :users_id, :only_integer => true
validates_numericality_of :institutions_id, :only_integer => true

end
