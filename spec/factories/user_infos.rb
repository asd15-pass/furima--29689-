FactoryBot.define do
  factory :user_info do
     postcode          {"123-4567"}
     consignor_id      {2}
     city              {"青森市"}
     consignor_code    {"青山1−1−1"}
     phone_number      {"08034526543"}
     building_name      {"ヒカリビル"}
     token   {"samplesamplesamplesample"}
     association :user 
     association :item
  end
end
