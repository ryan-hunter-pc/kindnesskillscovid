require 'rails_helper'

RSpec.describe "Customer edits errand", type: :system do
  scenario 'navigates via the edit button on errand page' do
    customer = create(:customer)
    errand = create(:errand, customer: customer)

    visit root_path(as: customer.user)
    click_on_errand(errand)
    click_on "Edit Errand"

    expect(page).to have_content "Edit Errand"
    expect(page).to have_current_path(edit_errand_path(errand))
  end

  scenario 'updates all possible fields' do
    customer = create(:customer)
    errand = create(:errand, customer: customer)

    visit edit_errand_path(errand, as: customer.user)
    fill_in 'Short description', with: "New short description"
    fill_in 'Full description', with: "New long description"
    click_on 'Save Errand'

    expect(page).to have_content 'Errand saved'
    expect(page).to have_css('.short_description', text: "New short description")
    expect(page).to have_css('.status', text: "Requested")
    expect(page).to have_css('.full_description', text: "New long description")
  end

  def click_on_errand(errand)
    find("#errand_#{errand.id}").click
  end
end
