FactoryGirl.define do
  factory :tenant do
    name { Faker::Name.name }
    api_key '1234ABCD'
  end
end
