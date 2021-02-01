class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :prefecture, :house_num, :building_name, :phone_num, :user_id, :item_id, :token

  # 「電話番号」の郵便番号に関するバリデーション
  validates :phone_num, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters." }
  # 「住所」の郵便番号に関するバリデーション
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }

  with_options presence: true do
    validates :postal_code, :city, :house_num, :phone_num, :token, :user_id, :item_id
  end
    
  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    # 各テーブルにデータを保存する処理を書く
        # 住所の情報を保存
        order = Order.create(user_id: user_id, item_id: item_id)
        Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_num: house_num, building_name: building_name, phone_num: phone_num)
  end
end