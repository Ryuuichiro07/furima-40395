FactoryBot.define do
  factory :shipping_informaiton do
    association :purchase_record 
  

    post_code              {Faker::Number.number(digits: 3) + '-' + Faker::Number.number(digits: 4) }
    region_of_origin_id                 {Faker::Number.between(from: 2, to: 48) }
    municipality              {Faker::Japanese::Address.city }
    street_address {Faker::Address.street_address}
    building          {Faker::Address.building_number}
    telephone_number          {Faker::PhoneNumber.cell_phone_in_e164}
  end
end
