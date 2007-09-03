class Configuration < ActiveRecord::Base
has_one  :theme

 validates_presence_of :number_participants
 validates_presence_of :questions_max
end
