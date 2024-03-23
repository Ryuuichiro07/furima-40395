FactoryBot.define do
  factory :order_form do
    token {"tok_abcdefghijk00000000000000000"}

    post_code              {Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    region_of_origin_id                 {Faker::Number.between(from: 2, to: 48) }
    municipality              {Faker::Address.city }
    street_address {Faker::Address.street_address}
    building          {Faker::Address.building_number}
    telephone_number { Faker::Number.leading_zero_number(digits: 11) }
  end
end
