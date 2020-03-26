require 'rails_helper'

RSpec.describe "Customer accepts offer", type: :system do
  scenario 'via errand page' do
    customer = create(:customer)
    errand = create(:errand, customer: customer, status: 'requested')
    volunteer = create(:volunteer)
    offer = create(:offer, errand: errand, volunteer: volunteer)

    visit errand_path(errand, as: customer.user)
    within "#offer_#{offer.id}" do
      click_on "Accept"
    end

    expect(page).to have_content 'Offer accepted'
    expect(page).to have_current_path(errand_path(errand))
    expect(page).to have_css('.status', text: 'Assigned')
  end
end
