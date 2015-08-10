require 'faker'

FactoryGirl.define do
  factory :user do
    nickname { Faker::Internet.user_name }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password(8, 20) }
  end
end
