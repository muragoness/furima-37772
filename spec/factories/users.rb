FactoryBot.define do
  factory :user do

    jp_user = Gimei.name
   

    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { jp_user.last.kanji }
    first_name { jp_user.first.kanji }
    last_name_kana { jp_user.last.katakana }
    first_name_kana { jp_user.first.katakana }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2018-12-31') }
  end
end