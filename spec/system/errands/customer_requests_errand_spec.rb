require 'rails_helper'

RSpec.describe "Customer requests errand", type: :system do
  scenario 'navigates via the prompt to create first errand' do
    visit root_path(as: create(:customer_user))
    click_on 'Request Errand'

    expect(page).to have_content "New Errand"
    expect(page).to have_current_path(new_errand_path)
  end

  scenario 'navigates via the add errand button' do
    visit root_path(as: create(:customer_user))
    click_on 'New Errand'

    expect(page).to have_content "New Errand"
    expect(page).to have_current_path(new_errand_path)
  end

  scenario 'with minimum required fields' do
    customer = create(:customer)

    visit root_path(as: customer.user)
    click_on 'Request Errand'
    fill_in 'Short description', with: "Pickup prescription at Walgreens"
    click_on 'Save Errand'

    expect(page).to have_content 'Errand saved'
    expect(page).to have_css('.short_description', text: "Pickup prescription at Walgreens")
    expect(page).to have_css('.status', text: "Requested")
  end

  scenario 'with all possible fields' do
    customer = create(:customer)

    visit root_path(as: customer.user)
    click_on 'Request Errand'
    fill_in 'Short description', with: "Pickup prescription at Walgreens"
    fill_in 'Full description', with: "Pickup prescription at Walgreens\n\nUnder Martha Smith"
    click_on 'Save Errand'

    expect(page).to have_content 'Errand saved'
    expect(page).to have_css('.short_description', text: "Pickup prescription at Walgreens")
    expect(page).to have_css('.status', text: "Requested")
    expect(page).to have_css('.full_description', text: "Pickup prescription at Walgreens\nUnder Martha Smith")
  end
end
