FactoryGirl.define do
  factory :question do
    title { Faker::Lorem.word }
    private { Faker::Boolean.boolean }
    user_id 1
  end
end
