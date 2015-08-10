require 'faker'

FactoryGirl.define do
  factory :article do
    association :user
    title { Faker::Internet.user_name }
    text { Faker::Internet.safe_email }
    date { Faker::Internet.password(8, 20) }
    priority { Faker::Number.decimal(100) }
    completed "false"
  end
end
