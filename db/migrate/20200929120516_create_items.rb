class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references  :user,null: false,foreign_key: true
      t.string      :name, null: false
      t.text        :items_description,null: false
      t.integer     :category,null: false
      t.integer     :condition,null: false
      t.integer     :shipping_payer,null: false
      t.integer     :consignor,null: false
      t.integer     :derivery_time,null: false
      t.integer     :price,null: false



      t.timestamps
    end
  end
end
