class Errand < ApplicationRecord
  belongs_to :customer
  belongs_to :volunteer, optional: true
  has_many :offers

  enum status: { requested: 0, assigned: 1, completed: 2, cancelled: 3 }

  validates :short_description, presence: true

  delegate :city, :state, to: :customer

  def self.offerable_for(volunteer)
    already_offered = joins(:offers).where(offers: { status: 'submitted', volunteer: volunteer })
    requested.where.not(id: already_offered.pluck(:id))
  end
end
