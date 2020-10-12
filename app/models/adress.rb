class Adress < ApplicationRecord
  with_options presence: true do
    validates :order_id
    validates :postcode
    validates :consignor_id
    validates :phone_number
    validates :city
    validates :building_name
  end
end
