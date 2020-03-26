namespace :dev do
  desc 'Creates sample data for local development'
  task prime: :environment do
    unless Rails.env.development?
      raise 'This task can only be run in the development environment'
    end

    customer_user = User.create! email: 'customer@example.com', password: 'password'
    volunteer_user = User.create! email: 'volunteer@example.com', password: 'password'
    customer_user2 = User.create! email: 'customer2@example.com', password: 'password'
    volunteer_user2 = User.create! email: 'volunteer2@example.com', password: 'password'

    customer = Customer.create! user: customer_user, first_name: 'Bob', last_name: 'Smith',
                                phone: '435-555-5555', address: '1450 Park Ave',
                                city: 'Park City', state: 'UT', zip: '84060'

    volunteer = Volunteer.create! user: volunteer_user, first_name: 'John', last_name: 'Doe',
                                  phone: '435-555-1234', address: '650 Main St',
                                  city: 'Park City', state: 'UT', zip: '84060'

    customer2 = Customer.create! user: customer_user2, first_name: 'Sally', last_name: 'McDonald',
                                phone: '435-555-4321', address: '5870 Silver Summit Pkwy',
                                city: 'Park City', state: 'UT', zip: '84098'

    volunteer2 = Volunteer.create! user: volunteer_user2, first_name: 'Amanda', last_name: 'Breton',
                                  phone: '435-555-9876', address: '9775 Silver Creek Rd',
                                  city: 'Park City', state: 'UT', zip: '84098'

    errand = Errand.create! status: 'requested', customer: customer,
                            short_description: "Pickup prescription from Walgreens",
                            full_description: "Under name Robert Smith\n\nCall to pay over phone if possible"

    errand2 = Errand.create! status: 'assigned', customer: customer2, volunteer: volunteer2,
                             short_description: "Buy groceries",
                             full_description: "Any store you want:\n\n- Milk\n- Eggs\n- Bread\n"

    errand3 = Errand.create! status: 'requested', customer: customer2,
                             short_description: "Pickup glasses from Moran Eye Center",
                             full_description: "Call when there and I will authorize via phone"

    offer = Offer.create! status: 'submitted', errand: errand, volunteer: volunteer
    offer2 = Offer.create! status: 'accepted', accepted_at: Time.current,
                           errand: errand2, volunteer: volunteer2,
                           message: "I live right across the road, I can go any time"
  end
end
