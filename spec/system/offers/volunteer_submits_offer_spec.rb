require 'rails_helper'

RSpec.describe "Volunteer submits offer", type: :system do
  scenario 'navigates via errands search' do
    volunteer = create(:volunteer)
    errand = create(:errand, status: 'requested')

    visit root_path(as: volunteer.user)
    click_on "Find Errands"
    click_on errand.short_description
    click_on "Offer to Run This Errand"

    expect(page).to have_current_path new_errand_offer_path(errand)
  end

  scenario 'with minimum required fields' do
    volunteer = create(:volunteer)
    errand = create(:errand, status: 'requested')

    visit errand_path(errand, as: volunteer.user)
    click_on "Offer to Run This Errand"
    click_on "Send Offer"

    expect(page).to have_content 'Offer sent'
    expect(page).to have_current_path(offers_path)
    expect(page).to have_content errand.short_description
  end
end
