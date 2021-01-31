class PurchaseForm
  include ActiveModel::Model
  attr_accessor :order_id, :postal_code, :prefecture_id, :city, :prefecture, :house_num, :building_name, :phone_num, :user_id, :item_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    # validates :name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
    # validates :name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }
    validates :phone_num, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters." }
    # 「住所」の郵便番号に関するバリデーション
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    end
  # 「住所」の都道府県に関するバリデーション
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    
  def save
    # 各テーブルにデータを保存する処理を書く
        # 住所の情報を保存
        order = Order.create(user_id: user_id, item_id: item_id)
        Address.create!(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_num: house_num, building_name: building_name, phone_num: phone_num)
  end
end