require 'rails_helper'

RSpec.describe Volunteer, type: :model do
  describe '#full_name' do
    it 'returns the first and last name separated by one space' do
      volunteer = build(:volunteer, first_name: 'Bob', last_name: 'Smith')

      expect(volunteer.full_name).to eq 'Bob Smith'
    end
  end

  describe '#location' do
    it 'returns the city and state separated by comma' do
      volunteer = build(:volunteer, city: 'Park City', state: 'UT')

      expect(volunteer.location).to eq 'Park City, UT'
    end
  end
end
