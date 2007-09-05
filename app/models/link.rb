class Link < ActiveRecord::Base
belongs_to  :theme

validates_presence_of :theme_id
validates_presence_of :description
validates_presence_of :address
validates_numericality_of :theme_id, :only_integer => true
end
