class Errand < ApplicationRecord
  belongs_to :customer
  belongs_to :volunteer, optional: true
  has_many :offers

  enum status: { requested: 0, offered: 1, accepted: 2, completed: 3, cancelled: 4 }

  validates :short_description, presence: true

  delegate :city, :state, to: :customer
end
