class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references  :user,null: false,foreign_key: true
      t.string      :name, null: false
      t.text        :items_description,null: false
      t.integer     :category_id,null: false
      t.integer     :condition_id,null: false
      t.integer     :shipping_payer_id,null: false
      t.integer     :consignor_id,null: false
      t.integer     :derivery_time_id,null: false
      t.integer     :price,null: false



      t.timestamps
    end
  end
end
