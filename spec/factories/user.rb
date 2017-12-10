FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email ' me@email.com '
    password 'password'
  end
end
