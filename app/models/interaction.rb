class Interaction < ActiveRecord::Base
belongs_to  :participation
belongs_to  :question
belongs_to  :answer
end
