require 'rails_helper'

RSpec.describe "Visitor signs up as volunteer", type: :system do
  scenario "with minimum required fields" do
    visit root_path
    click_on "Volunteer"
    fill_in "Your Email", with: "bob@example.com"
    fill_in "Choose a Password", with: "password"
    click_on "Continue"
    fill_in "First name", with: "Bob"
    fill_in "Last name", with: "Smith"
    fill_in "Address", with: "123 Test Ave"
    fill_in "City", with: "Testville"
    fill_in "State", with: "UT"
    fill_in "Zip", with: "84123"
    click_on "Continue"

    expect(page).to have_content "Account created successfully"
    expect(page).to have_content "Dashboard"
    user = User.last
    expect(user.email).to eq "bob@example.com"
    volunteer = Volunteer.last
    expect(volunteer.user).to eq user
    expect(volunteer.first_name).to eq "Bob"
    expect(volunteer.last_name).to eq "Smith"
    expect(volunteer.address).to eq "123 Test Ave"
    expect(volunteer.city).to eq "Testville"
    expect(volunteer.state).to eq "UT"
    expect(volunteer.zip).to eq "84123"
  end
end
