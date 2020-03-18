FactoryBot.define do
  factory :volunteer do
    user
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.unique.last_name }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip { Faker::Address.zip_code }
  end
end
