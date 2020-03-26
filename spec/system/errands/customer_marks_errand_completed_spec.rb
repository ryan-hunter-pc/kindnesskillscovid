require 'rails_helper'

RSpec.describe "Customer marks errand completed", type: :system do
  scenario 'via button on errand page' do
    customer = create(:customer)
    errand = create(:errand, customer: customer, status: 'assigned', volunteer: create(:volunteer))

    visit errand_path(errand, as: customer.user)
    click_on 'Mark as Completed'

    expect(page).to have_content 'Errand saved'
    expect(page).to have_css('.short_description', text: errand.short_description)
    expect(page).to have_css('.status', text: "Completed")
  end
end
