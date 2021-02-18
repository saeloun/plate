# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    title { "MyString" }
    status { false }
  end
end
