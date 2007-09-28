class User < ActiveRecord::Base
has_many  :registrations
belongs_to :city


  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :login
  validates_presence_of :city_id
  validates_numericality_of :city_id, :only_integer => true
  validates_uniqueness_of :email, :case_sensitive => false
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_associated :city
  validates_presence_of :city

end
