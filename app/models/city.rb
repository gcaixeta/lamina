class City < ActiveRecord::Base
has_many  :users
belongs_to :state

validates_presence_of :name
end
