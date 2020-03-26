require 'rails_helper'

RSpec.describe "Volunteer views their errands", type: :system do
  scenario 'is redirected from dashboard' do
    volunteer = create(:volunteer)

    visit root_path(as: volunteer.user)

    expect(page).to have_current_path errands_path
  end

  scenario 'sees list of errands they have been selected to run' do
    volunteer = create(:volunteer)
    errand1 = create(:errand, volunteer: volunteer, status: 'assigned')
    errand2 = create(:errand, volunteer: volunteer, status: 'assigned')
    errand3 = create(:errand)

    visit errands_path(as: volunteer.user)

    expect_to_see errand1
    expect_to_see errand2
    expect_to_not_see errand3
  end

  def expect_to_see(errand)
    expect(page).to have_content errand.short_description
  end

  def expect_to_not_see(errand)
    expect(page).to_not have_content errand.short_description
  end
end
