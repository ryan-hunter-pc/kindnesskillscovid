require 'rails_helper'

RSpec.describe "Volunteer searches errands", type: :system do
  scenario 'navigates via errands index' do
    volunteer = create(:volunteer)

    visit root_path(as: volunteer.user)
    click_on "Find Errands"

    expect(page).to have_current_path search_errands_path
  end

  scenario 'sees recently requested errands' do
    volunteer = create(:volunteer)
    errand1 = create(:errand, status: 'requested')
    errand2 = create(:errand, status: 'requested')

    visit search_errands_path(as: volunteer.user)

    expect_to_see errand1
    expect_to_see errand2
  end

  def expect_to_see(errand)
    expect(page).to have_content errand.short_description
  end

  def expect_to_not_see(errand)
    expect(page).to_not have_content errand.short_description
  end
end
