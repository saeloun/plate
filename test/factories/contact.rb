# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { "Charles Smith" }
    email { "charles@example.com" }
    message { "I am not able to signup" }
  end
end
