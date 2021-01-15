class Item < ApplicationRecord

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :shipping_fee, :prefecture, :scheduled

  with_options presence: true do
    validates :name, :info, :price, :category_id, :sale_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id
  end

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id, :sale_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id
  end
end