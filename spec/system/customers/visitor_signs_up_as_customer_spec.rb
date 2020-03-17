require 'rails_helper'

RSpec.describe "Visitor signs up as customer", type: :system do
  scenario "with minimum required fields" do
    visit root_path
    click_on "Request an Errand"
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
    customer = Customer.last
    expect(customer.user).to eq user
    expect(customer.first_name).to eq "Bob"
    expect(customer.last_name).to eq "Smith"
    expect(customer.address).to eq "123 Test Ave"
    expect(customer.city).to eq "Testville"
    expect(customer.state).to eq "UT"
    expect(customer.zip).to eq "84123"
  end
end
