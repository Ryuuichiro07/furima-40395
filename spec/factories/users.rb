FactoryBot.define do
  factory :user do
    nick_name              {Faker::Name.initials(number: 4)}
    email                 {Faker::Internet.email}
    password              { "a1" + Faker::Internet.password(min_length: 4) }
    password_confirmation {password}
    first_name          {"山田"}
    last_name          {"太朗"}
    first_name_kana    {"ヤマダ"}
    last_name_kana    {"タロウ"}
    date_of_birth    {"2000-01-01"}
  end
end