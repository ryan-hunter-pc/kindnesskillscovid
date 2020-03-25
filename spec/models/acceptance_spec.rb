require 'rails_helper'

RSpec.describe Acceptance do
  describe 'params' do
    it 'accepts offer_id parameter' do
      acceptance = Acceptance.new(offer_id: 1)

      expect(acceptance.offer_id).to eq 1
    end
  end

  describe '#save' do
    it 'sets the offer as accepted' do
      offer = create(:offer)
      current_time = Time.current.change(usec: 0)

      Timecop.freeze(current_time) do
        acceptance = Acceptance.new(offer_id: offer.id)
        acceptance.save
      end

      offer.reload
      expect(offer.status).to eq 'accepted'
      expect(offer.accepted_at).to eq current_time
    end

    it 'sets the errand as accepted' do
      errand = create(:errand)
      offer = create(:offer, errand: errand)

      acceptance = Acceptance.new(offer_id: offer.id)
      acceptance.save

      errand.reload
      expect(errand.status).to eq 'accepted'
    end

    it 'sets the volunteer on the errand' do
      volunteer = create(:volunteer)
      errand = create(:errand)
      offer = create(:offer, errand: errand, volunteer: volunteer)

      acceptance = Acceptance.new(offer_id: offer.id)
      acceptance.save

      errand.reload
      expect(errand.volunteer).to eq volunteer
    end
  end
end
