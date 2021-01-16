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

      it "category_idが空では登録できないこと" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end

      it "sale_status_idが空では登録できないこと" do
        @item.sale_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Sale status can't be blank", "Sale status is not a number")
      end

      it "shipping_fee_status_idが空では登録できないこと" do
        @item.shipping_fee_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank", "Shipping fee status is not a number")
      end

      it "prefecture_idが空では登録できないこと" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end

      it "scheduled_delivery_idが空では登録できないこと" do
        @item.scheduled_delivery_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank", "Scheduled delivery is not a number")
      end

    end
  end
end