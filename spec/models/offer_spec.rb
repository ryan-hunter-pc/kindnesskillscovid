require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe '#errand_description' do
    it 'returns the short description of the errand' do
      errand = build_stubbed(:errand)
      offer = build(:offer, errand: errand)

      expect(offer.errand_description).to eq errand.short_description
    end
  end

  describe '#errand_location' do
    it 'returns the city and state of the errand' do
      customer = build_stubbed(:customer, city: "Park City", state: "UT")
      errand = build_stubbed(:errand, customer: customer)
      offer = build(:offer, errand: errand)

      expect(offer.errand_location).to eq "Park City, UT"
    end
  end

  describe '#volunteer_name' do
    it 'returns the full name of the volunteer' do
      volunteer = build_stubbed(:volunteer, first_name: 'Bob', last_name: 'Smith')
      offer = build(:offer, volunteer: volunteer)

      expect(offer.volunteer_name).to eq "Bob Smith"
    end
  end

  describe '#volunteer_location' do
    it 'returns the city and state of the errand' do
      volunteer = build_stubbed(:volunteer, city: "Park City", state: "UT")
      offer = build(:offer, volunteer: volunteer)

      expect(offer.volunteer_location).to eq "Park City, UT"
    end
  end
end
