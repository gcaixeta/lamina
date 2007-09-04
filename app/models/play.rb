class Play < ActiveRecord::Base
belongs_to  :player
belongs_to  :anwer
belongs_to  :question

validates_presence_of :players_id
validates_presence_of :answers_id
validates_presence_of :questions_id

validates_numericality_of :players_id, :only_integer => true
validates_numericality_of :answers_id, :only_integer => true
validates_numericality_of :questions_id, :only_integer => true
end
