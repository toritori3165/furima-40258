FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { 'a1' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    last_name   { '山田' }
    first_name  { '太郎' }
    last_name_kana  { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2019-12-31') }
  end
end
