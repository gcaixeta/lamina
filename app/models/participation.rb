class Participation < ActiveRecord::Base
belongs_to :registration
belongs_to :group

has_many :mensagens
has_many :interactions

end
