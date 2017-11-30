FactoryGirl.define do
  factory :question do
    body { Faker::Lorem.sentence }
    question_id 1
    user_id 1
  end
end
