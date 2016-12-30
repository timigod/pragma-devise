FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }

    trait :confirmed do
      confirmed_at { Time.zone.now }
    end
  end
end
