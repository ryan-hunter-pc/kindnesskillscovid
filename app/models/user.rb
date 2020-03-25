class User < ApplicationRecord
  include Clearance::User

  has_one :customer
  has_one :volunteer

  attribute :role, :string, default: 'customer'

  def customer?
    customer.present?
  end

  def customer_id
    customer&.id
  end

  def volunteer?
    volunteer.present?
  end

  def volunteer_id
    volunteer&.id
  end

  def errands
    (customer || volunteer)&.errands || Errand.none
  end

  def offers
    volunteer&.offers
  end
end
