class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ownerships
  has_many :owned_groups, through: :ownerships, source: :group

  has_many :memberships
  has_many :joined_groups, through: :memberships, source: :group
end
