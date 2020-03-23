class User < ApplicationRecord
  include Clearance::User

  has_one :customer
  has_many :errands, through: :customer

  attribute :role, :string, default: 'customer'

  def customer?
    role == 'customer'
  end
end
