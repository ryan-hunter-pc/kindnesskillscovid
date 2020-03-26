require 'rails_helper'

RSpec.describe Errand, type: :model do
  describe '.offerable_for(volunteer)' do
    it 'only includes errands which are requested' do
      volunteer = create(:volunteer)
      errand1 = create(:errand, status: 'requested')
      errand2 = create(:errand, status: 'assigned')

      results = Errand.offerable_for(volunteer)

      expect(results).to include errand1
      expect(results).to_not include errand2
    end

    it 'does not include errands which the given user has already offered to run' do
      volunteer = create(:volunteer)
      errand1 = create(:errand, status: 'requested')
      errand2 = create(:errand, status: 'requested')
      create(:offer, errand: errand2, volunteer: volunteer)

      results = Errand.offerable_for(volunteer)

      expect(results).to include errand1
      expect(results).to_not include errand2
    end

    it 'only includes each errand once' do
      volunteer = create(:volunteer)
      errand1 = create(:errand, status: 'requested')
      errand2 = create(:errand, status: 'requested')
      create(:offer, errand: errand1, volunteer: create(:volunteer))
      create(:offer, errand: errand1, volunteer: create(:volunteer))
      create(:offer, errand: errand2, volunteer: create(:volunteer))

      results = Errand.offerable_for(volunteer)

      expect(results.count).to eq 2
      expect(results).to include errand1
      expect(results).to include errand2
    end
  end
end
