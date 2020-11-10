# frozen_string_literal: true

# class  documentation
FactoryBot.define do
  factory :testmodel do
    name { Faker::Name.name }
    color { Faker::Color.hex_color }
  end
end
