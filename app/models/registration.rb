class Registration < ActiveRecord::Base
belongs_to  :user
belongs_to  :profile
belongs_to  :institution
has_many :participations
has_many :proposals
has_many :themes, :through => :proposals
has_many :groups, :through => :participations


  validates_presence_of :profile_id
  validates_presence_of :user_id
  validates_presence_of :institution_id

  validates_presence_of :profile
  validates_associated :profile

  validates_presence_of :institution
  validates_associated :institution

  validates_presence_of :user
  validates_associated :user

validates_numericality_of :profile_id, :only_integer => true
validates_numericality_of :user_id, :only_integer => true
validates_numericality_of :institution_id, :only_integer => true

end
