class User < ApplicationRecord
  attr_accessor :username

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
end
