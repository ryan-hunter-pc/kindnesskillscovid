class Acceptance
  include ActiveModel::Model

  attr_accessor :offer_id

  validates :offer_id, presence: true

  def offer
    @offer ||= Offer.find_by_id(offer_id)
  end

  def errand
    @errand ||= offer&.errand
  end

  def save
    if valid?
      persist!
    else
      false
    end
  end

  private

  def persist!
    saved = false
    ActiveRecord::Base.transaction do
      offer.status = 'accepted'
      offer.accepted_at = Time.current
      offer.save!

      errand.status = 'accepted'
      errand.volunteer = offer.volunteer
      errand.save!

      saved = true
    end
    saved
  end
end
