class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.references   :order,null: false,foreign_key: true
      t.integer      :postcode, null: false
      t.integer      :consignor_id,null: false
      t.integer      :consignor_code,null: false
      t.integer      :phone_number,null: false
      t.string       :city,null: false
      t.string       :building_name
     
      t.timestamps
    end
  end
end
