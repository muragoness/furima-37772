FactoryBot.define do
  factory :item do
    name         { Faker::Name.initials }
    explanation       { Faker::Lorem.sentence }
    category_id          { 2 }
    condition_id { 2 }
    delivery_charge_id { 2 }
    prefectures_id           { 3 }
    days_for_delivery_id   { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public//images/test_image.png.jpg'), filename: 'test_image.png.jpg')
    end
  end
end