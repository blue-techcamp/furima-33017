FactoryBot.define do
  factory :purchase_form do
    postal_code {"444-4444"}
    prefecture_id {2}
    city {"横浜市緑区"}
    house_num {"青山1-1"}
    building_name {"廃ビル1"}
    phone_num {"09000000000"}
  end
end