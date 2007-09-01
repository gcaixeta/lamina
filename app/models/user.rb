class User < ActiveRecord::Base
has_many  :registrations
belongs_to :city
end
