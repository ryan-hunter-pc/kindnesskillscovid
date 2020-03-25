require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#customer?' do
    it 'returns true if the user has an associated customer' do
      user = create(:user)
      create(:customer, user: user)

      expect(user.reload.customer?).to eq true
    end

    it 'returns false if the user does not have an associated customer' do
      user = create(:user)

      expect(user.customer?).to eq false
    end
  end

  describe '#volunteer?' do
    it 'returns true if the user has an associated volunteer' do
      user = create(:user)
      create(:volunteer, user: user)

      expect(user.reload.volunteer?).to eq true
    end

    it 'returns false if the user does not have an associated volunteer' do
      user = create(:user)

      expect(user.volunteer?).to eq false
    end
  end

  describe '#errands' do
    it 'returns the errands created by the user if user is a customer' do
      user = create(:user)
      customer = create(:customer, user: user)
      errand1 = create(:errand, customer: customer)
      errand2 = create(:errand, customer: customer)
      errand3 = create(:errand, customer: build(:customer))

      results = user.errands

      expect(results).to include errand1
      expect(results).to include errand2
      expect(results).to_not include errand3
    end

    it 'returns the errands assigned to the user if user is a volunteer' do
      user = create(:user)
      volunteer = create(:volunteer, user: user)
      errand1 = create(:errand, volunteer: volunteer)
      errand2 = create(:errand, volunteer: volunteer)
      errand3 = create(:errand, volunteer: build(:volunteer))

      results = user.errands

      expect(results).to include errand1
      expect(results).to include errand2
      expect(results).to_not include errand3
    end

    it 'returns an empty relation if user is neither a customer nor a volunteer' do
      user = create(:user)

      expect(user.errands).to be_empty
    end
  end
end
