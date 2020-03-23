class User < ApplicationRecord
  include Clearance::User

  has_one :customer
  has_one :volunteer

  attribute :role, :string, default: 'customer'

  def customer?
    customer.present?
  end

  def volunteer?
    volunteer.present?
  end

  def errands
    (customer || volunteer)&.errands || Errand.none
  end
end
