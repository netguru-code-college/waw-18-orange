class Group < ApplicationRecord
  attr_accessor :amount
  has_many :ownerships
  has_many :organizers, through: :ownerships, source: :user

  has_many :memberships
  has_many :members, through: :memberships, source: :user

  has_many :payments

  accepts_nested_attributes_for :members

  def prepare_payments(amount)
    members.each do |member|
      payments.create(user: member, amount: amount)
    end
  end
end
