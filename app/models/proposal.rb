class Proposal < ActiveRecord::Base
belongs_to :registration
belongs_to :theme
end
