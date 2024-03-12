FactoryBot.define do
  factory :item do
    association :user

    name              {Faker::Name.initials(number: 4)}
    explantion                 {"これは新品です"}
    category_id              {Faker::Number.between(from: 2, to: 10)  }
    situation_id          {Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id          {Faker::Number.between(from: 2, to: 3) }
    region_of_origin_id    {Faker::Number.between(from: 2, to: 48) }
    number_of_days_until_shipping_id  { Faker::Number.between(from: 2, to: 4)}
    price    {"1000"}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
