class Item < ApplicationRecord

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :shipping_fee, :prefecture, :scheduled

  with_options presence: true do
    validates :image, :name, :info, :price
  end

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id, :sale_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id
  end

  #価格の範囲を300-9,999,999の間出ないと保存できないようにする
  validates :price, numericality: {only_integer: true, greater_than:299}, length: { in: 3..7 }
end