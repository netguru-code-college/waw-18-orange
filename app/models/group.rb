class Group < ApplicationRecord
  has_many :ownerships
  has_many :organizers, through: :ownerships, class_name: 'User'
  

end
