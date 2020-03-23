class Errand < ApplicationRecord
  belongs_to :customer
  belongs_to :volunteer, optional: true

  enum status: { requested: 0 }

  validates :short_description, presence: true

  delegate :city, :state, to: :customer
end
