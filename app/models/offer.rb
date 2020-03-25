class Offer < ApplicationRecord
  belongs_to :errand
  belongs_to :volunteer

  enum status: { submitted: 0, accepted: 1 }

  def errand_description
    errand.short_description
  end

  def errand_location
    [errand.city, errand.state].compact.join(', ')
  end

  def volunteer_name
    volunteer.full_name
  end

  def volunteer_location
    volunteer.location
  end
end
