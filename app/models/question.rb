class Question < ActiveRecord::Base
has_many  :anwers
has_many  :interactions
has_many  :plays

validates_presence_of :text
end
