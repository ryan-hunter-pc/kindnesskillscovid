require 'rails_helper'

RSpec.describe "Volunteer removes offer", type: :system do
  scenario 'via offer page', js: true do
    volunteer = create(:volunteer)
    errand = create(:errand)
    offer = create(:offer, status: 'submitted', errand: errand, volunteer: volunteer)

    visit offer_path(offer, as: volunteer.user)
    accept_confirm { click_on "Remove Offer" }

    expect(page).to have_content "Offer removed"
    expect(page).to have_current_path offers_path
    expect(page).to_not have_content errand.short_description
  end
end
