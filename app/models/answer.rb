class Answer < ActiveRecord::Base
has_many  :interactions
belongs_to  :question
has_many  :plays
end
