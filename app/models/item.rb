class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  #空の投稿を保存できないようにする
  validates :info, :price, :sale_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
end