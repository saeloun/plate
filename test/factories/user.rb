# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    random_number = SecureRandom.hex(10)
    email { "#{random_number}@example.com" }
    first_name { random_number }
    last_name { random_number }
    password { "welcome" }

    trait :with_super_admin_role do
      before(:create) do |user|
        user.email = "admin@example.com"
        user.role = "admin"
      end
    end

    factory :super_admin_user, traits: [:with_super_admin_role]
  end
end
