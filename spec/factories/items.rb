FactoryBot.define do
  factory :item do
    association :user
    image             {"test12345"}
    name              {"テスト"}
    items_description                 {"テストです"}
    category_id              {"レディース"}
    condition_id             {"未使用に近い"}
    shipping_payer_id           {"着払い"}
    consignor_id       {"北海道"}
    derivery_time_id       {"1~2日での発送"}
    price            {"15000"}
  end
end