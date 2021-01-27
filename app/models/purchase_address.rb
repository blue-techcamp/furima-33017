class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :purchase_record, :postal_code, :prefecture_id, :city, :prefecture, :city, :house_num, :building_name, :phone_num, :user, :item
end