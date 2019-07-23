# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { "welcome" }

    trait :with_super_admin_role do
      before(:create) do |user|
        user.role = "admin"
      end
    end

    factory :super_admin_user, traits: [:with_super_admin_role]
  end
end
