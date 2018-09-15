class Group < ApplicationRecord
  #belongs_to :organizers, class_name: 'User'
  belongs_to :users
end
