class UserInfo
  include ActiveModel::Model
  attr_accessor :user_id, :item_id ,:postcode,:consignor_id,:phone_number,:city,:building_name,:token,:consignor_code
    with_options presence: true do
      validates :postcode
      validates :consignor_id
      validates :phone_number
      validates :city
      validates :consignor_code
    end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Adress.create(order_id: order.id, postcode: postcode, city: city,phone_number: phone_number , consignor_id: consignor_id, consignor_code: consignor_code,building_name: building_name)
    
  end
end