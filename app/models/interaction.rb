class Interaction < ActiveRecord::Base
belongs_to  :participation
belongs_to  :question
belongs_to  :answer

validates_presence_of :participations_id
validates_presence_of :answers_id
validates_presence_of :questions_id

validates_numericality_of :participations_id, :only_integer => true
validates_numericality_of :answers_id, :only_integer => true
validates_numericality_of :questions_id, :only_integer => true
end
