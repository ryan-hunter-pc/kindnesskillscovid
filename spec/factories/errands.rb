FactoryBot.define do
  factory :errand do
    customer
    status { 'requested' }
    sequence(:short_description) { |n| "Errand #{n}" }
  end
end
