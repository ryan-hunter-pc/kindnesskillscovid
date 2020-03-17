require 'rails_helper'

RSpec.feature 'Visitor sees home page' do
  scenario 'sees the headline and hero' do
    visit root_path

    expect(page).to have_content 'Kindness Kills COVID-19'
    expect(page).to have_content 'Which are you?'
    expect(page).to have_content 'Request an Errand'
    expect(page).to have_content 'Volunteer'
  end
end
