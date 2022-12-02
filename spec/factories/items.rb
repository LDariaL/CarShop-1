FactoryBot.define do
  factory :item do
    price         { rand 100..1000000 }
    name          { Faker::Lorem.word.downcase }
    real          { [true, false].sample }
    weight        { rand 800..2900 }
    description   { Faker::Lorem.word.downcase }
  end
end