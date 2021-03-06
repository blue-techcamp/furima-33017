class User < ApplicationRecord
  has_many :items
  has_many :order
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers' 

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' } do
    validates :first_name,:last_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } do
    validates :first_name_kana, :last_name_kana
  end
end