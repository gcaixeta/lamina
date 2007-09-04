class Profile < ActiveRecord::Base
has_many  :registrations

validates_presence_of :description
  
end
