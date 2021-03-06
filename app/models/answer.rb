class Answer < ActiveRecord::Base
has_one :activity, :as => :creation
belongs_to  :question
has_many  :plays

#validates_presence_of :correct
validates_presence_of :text
validates_presence_of :question_id

validates_numericality_of :question_id, :only_integer => true

validates_presence_of :question
validates_associated :question

end
