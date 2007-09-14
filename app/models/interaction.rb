class Interaction < ActiveRecord::Base
belongs_to  :participation
belongs_to  :question
belongs_to  :answer

validates_presence_of :participation_id
validates_presence_of :answer_id
validates_presence_of :question_id

validates_numericality_of :participation_id, :only_integer => true
validates_numericality_of :answer_id, :only_integer => true
validates_numericality_of :question_id, :only_integer => true

validates_presence_of :participation
validates_associated :participation

validates_presence_of :answer
validates_associated :answer

validates_presence_of :question
validates_associated :question
end
