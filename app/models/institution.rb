class Institution < ActiveRecord::Base
attr_protected :active
has_many  :registrations
has_many :users, :through => :registrations

validates_uniqueness_of :email, :case_sensitive => false
validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

validates_presence_of :name
validates_presence_of :cnpj
validates_presence_of :telephone
validates_presence_of :email


end
