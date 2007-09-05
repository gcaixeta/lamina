class Archive < ActiveRecord::Base
belongs_to  :theme

validates_presence_of :name
validates_presence_of :description
validates_presence_of :heading

validates_numericality_of :theme_id, :only_integer => true
end
