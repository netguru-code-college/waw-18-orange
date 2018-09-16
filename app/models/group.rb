class Group < ApplicationRecord
  has_many :ownerships
  has_many :organizers, through: :ownerships, source: :user

  has_many :memberships
  has_many :members, through: :memberships, source: :user
  
  accepts_nested_attributes_for :memberships

end
