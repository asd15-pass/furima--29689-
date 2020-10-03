FactoryBot.define do
  factory :item do
      association :user 
      name              {"テスト"}
      items_description                 {"テストです"}
      category_id              {3}
      condition_id             {2}
      shipping_payer_id           {2}
      consignor_id       {2}
      derivery_time_id       {2}
      price            {15000}

      after(:build) do |item|
        item.image.attach(io: File.open('public/images/camera.png'), filename: 'camera.png')
      end
   end
end