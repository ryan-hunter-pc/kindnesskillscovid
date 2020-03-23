FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password" }

    factory :customer_user do
      after(:create) do |user, evaluator|
        create(:customer, user: user)
      end
    end
  end
end
