FactoryBot.define do
  factory :item do
    user_id {"2"}
    name {"商品名"}
    info {"商品の説明"}
    price {"9999999"}
    category_id {"2"}
    sale_status_id {"2"}
    shipping_fee_status_id {"2"}
    prefecture_id {"2"}
    scheduled_delivery_id {"2"}
  end

  after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end