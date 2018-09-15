class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :ownerships
  has_many :owned_groups, through: :ownerships, source: :group

end
