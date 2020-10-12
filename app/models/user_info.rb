class UserInfo
  include ActiveModel::Model
  attr_accessor :user_id, :item_id ,:postcode,:consignor_id,:phone_number,:city,:building_name,:token,:consignor_code
    with_options presence: true do
      validates :consignor_id,numericality:{ other_than: 1 } 
      validates :phone_number,length:{ maximum: 11, message: "11桁以内であること"}
      validates :city
      validates :consignor_code
      validates :postcode,format: { with:/\A\d{3}[-]\d{4}\z/,message: "にはハイフンが必要であること"}
      validates :token
      validates :user_id
      validates :item_id
    end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Adress.create(order_id: order.id, postcode: postcode, city: city,phone_number: phone_number , consignor_id: consignor_id, consignor_code: consignor_code,building_name: building_name)
  end
end