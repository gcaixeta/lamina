class Play < ActiveRecord::Base
belongs_to  :player
belongs_to  :anwer
belongs_to  :question
end
