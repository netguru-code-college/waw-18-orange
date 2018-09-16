class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
<<<<<<< HEAD
         :recoverable, :rememberable, :validatable
=======
         :recoverable, :rememberable, :validatable,
>>>>>>> 3e45b04131289fdd6e7b75086d1ddf23f06ada68

  has_many :ownerships
  has_many :owned_groups, through: :ownerships, source: :group

  has_many :memberships
  has_many :joined_groups, through: :memberships, source: :group
end
