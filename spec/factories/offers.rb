FactoryBot.define do
  factory :offer do
    errand
    volunteer
    status { 'submitted' }
  end
end
