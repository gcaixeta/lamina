class Question < ActiveRecord::Base
has_many  :answers
has_many  :plays

has_one :activity, :as => :creation

validates_presence_of :text
end
