class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order
      t.string :postal_code
      t.integer :prefecture_id
      t.string :city
      t.string :house_num
      t.string :building_name
      t.string :phone_num
      t.timestamps
    end
  end
end