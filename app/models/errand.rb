class Errand < ApplicationRecord
  belongs_to :customer

  enum status: { requested: 0 }

  validates :short_description, presence: true

  delegate :city, :state, to: :customer
end
