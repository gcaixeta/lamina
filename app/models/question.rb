class Question < ActiveRecord::Base
has_many  :anwers
has_many  :interactions
has_many  :plays
end
