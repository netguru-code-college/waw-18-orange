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
      Payment.create(user: member, group: self, amount: amount)
    end
  end
end
