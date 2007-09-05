class Play < ActiveRecord::Base
belongs_to  :player
belongs_to  :anwer
belongs_to  :question

validates_presence_of :player_id
validates_presence_of :answer_id
validates_presence_of :question_id

validates_numericality_of :player_id, :only_integer => true
validates_numericality_of :answer_id, :only_integer => true
validates_numericality_of :question_id, :only_integer => true
end
