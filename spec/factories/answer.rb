FactoryGirl.define do
  factory :question do
    title { Faker::Lorem.word }
    boolean { Faker::Boolean.boolean }
    user_id 1
  end
end
