# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "sam@example.com" }
    first_name { "Sam" }
    last_name { "Smith" }
    password { "welcome" }

    trait :with_super_admin_role do
      before(:create) do |user|
        user.role = "admin"
      end
    end

    factory :super_admin_user, traits: [:with_super_admin_role]
  end
end
