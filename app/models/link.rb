class Link < ActiveRecord::Base
belongs_to  :theme

validates_presence_of :themes_id
validates_presence_of :description
validates_presence_of :address
validates_numericality_of :themes_id, :only_integer => true
end
