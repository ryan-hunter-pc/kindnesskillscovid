require 'rails_helper'

RSpec.describe "Volunteer views offer", type: :system do
  scenario 'navigates via dashboard' do
    volunteer = create(:volunteer)
    errand = create(:errand)
    offer = create(:offer, errand: errand, volunteer: volunteer)

    visit root_path(as: volunteer.user)
    within "#sidebar" do
      click_on "My Offers"
    end
    click_on_offer offer

    expect(page).to have_current_path offer_path(offer)
  end

  scenario 'sees offer details' do
    volunteer = create(:volunteer)
    customer = create(:customer, city: "Park City", state: "UT")
    errand = create(:errand, customer: customer, short_description: "My short description")
    offer = create(:offer, status: 'submitted', errand: errand, volunteer: volunteer)

    visit offer_path(offer, as: volunteer.user)

    expect(page).to have_css('.errand_description', text: "My short description")
    expect(page).to have_css('.status', text: "Submitted")
    expect(page).to have_css('.errand_location', text: "Park City, UT")
  end

  def click_on_offer(offer)
    find("#offer_#{offer.id}").click
  end
end
