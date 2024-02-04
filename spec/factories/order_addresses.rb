FactoryBot.define do
  factory :order_address do
    zip_code { "123-4567" }
    area_id { 2 }
    city { Faker::Lorem.word }
    house_number { Faker::Lorem.word }
    tel {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
