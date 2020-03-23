require 'rails_helper'

RSpec.describe "Customer deletes errand", type: :system do
  scenario 'via the delete button on errand page', js: true do
    customer = create(:customer)
    errand = create(:errand, customer: customer)

    visit errand_path(errand, as: customer.user)
    accept_confirm { click_on('Delete Errand') }

    expect(page).to have_content 'Errand deleted'
    expect(page).to have_current_path errands_path
    expect(page).not_to have_content errand.short_description
  end
end
