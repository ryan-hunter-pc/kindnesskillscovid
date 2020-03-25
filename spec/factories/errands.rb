FactoryBot.define do
  factory :errand do
    customer
    volunteer { nil }
    status { 'requested' }
    sequence(:short_description) { |n| "Errand #{n}" }
  end
end
