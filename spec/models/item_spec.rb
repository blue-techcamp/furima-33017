require 'rails_helper'
RSpec.describe Item, type: :model do
  describe "商品出品" do

    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品がうまくいくとき' do
      it "全ての値が正常であれば登録できること" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "imageが空では登録できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空では登録できないこと" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "infoが空では登録できないこと" do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it "priceが空では登録できないこと" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "category_idが1では登録できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "sale_status_idが1では登録できないこと" do
        @item.sale_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sale status must be other than 1")
      end

      it "shipping_fee_status_idが1では登録できないこと" do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
      end

      it "prefecture_idが1では登録できないこと" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "scheduled_delivery_idが1では登録できないこと" do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
      end

    end
  end
end