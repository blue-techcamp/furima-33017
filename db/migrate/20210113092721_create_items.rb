class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,foreign_key: true
      t.string :name
      t.text :info
      t.integer :price
      t.integer :category_id
      t.integer :sale_status_id
      t.integer :shipping_fee_status_id
      t.integer :prefecture_id
      t.integer :scheduled_delivery_id
      t.timestamps
    end
  end
end
