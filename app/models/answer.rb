class Answer < ActiveRecord::Base
has_many  :interactions
belongs_to  :question
has_many  :plays

validates_presence_of :correct
validates_presence_of :text
validates_presence_of :question_id

validates_numericality_of :question_id, :only_integer => true
end
