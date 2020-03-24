class Offer < ApplicationRecord
  belongs_to :errand
  belongs_to :volunteer

  enum status: { submitted: 0 }

  def errand_description
    errand.short_description
  end

  def errand_location
    [errand.city, errand.state].compact.join(', ')
  end
end
