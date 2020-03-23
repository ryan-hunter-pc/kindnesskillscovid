require 'rails_helper'

RSpec.describe "Customer views their errands", type: :system do
  scenario 'is redirected from dashboard' do
    errand = create(:errand)
    customer = errand.customer
    user = customer.user

    visit root_path(as: user)

    expect(page).to have_current_path errands_path
  end

  scenario 'sees list of their own errands' do
    customer = create(:customer)
    errand1 = create(:errand, customer: customer)
    errand2 = create(:errand, customer: customer)
    other_errand = create(:errand, customer: create(:customer))

    visit errands_path(as: customer.user)

    expect_to_see errand1
    expect_to_see errand2
    expect_to_not_see other_errand
  end

  def expect_to_see(errand)
    expect(page).to have_content errand.short_description
  end

  def expect_to_not_see(errand)
    expect(page).to_not have_content errand.short_description
  end
end
