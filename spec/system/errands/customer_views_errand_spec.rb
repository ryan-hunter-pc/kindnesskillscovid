require 'rails_helper'

RSpec.describe "Customer views errand", type: :system do
  scenario 'navigates via dashboard' do
    errand = create(:errand)

    visit root_path(as: errand.customer.user)
    click_on_errand(errand)

    expect(page).to have_current_path errand_path(errand)
  end

  scenario 'sees errand details' do
    errand = create(:errand, full_description: "My full description")

    visit errand_path(errand, as: errand.customer.user)

    expect(page).to have_css('.short_description', text: errand.short_description)
    expect(page).to have_css('.status', text: errand.status)
    expect(page).to have_css('.full_description', text: errand.full_description)
  end

  def click_on_errand(errand)
    find("#errand_#{errand.id}").click
  end
end
