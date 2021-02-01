require 'rails_helper'
RSpec.describe PurchaseForm, type: :model do
  describe "購入" do

   before do
     @purchase_form = FactoryBot.build(:purchase_form)
   end

   context '購入がうまくいくとき' do
     it "全ての値が正常であれば購入できること" do
       expect(@purchase_form).to be_valid
     end
   end

   context '購入がうまくいかないとき' do
     it "postal_codeが空では購入できないこと" do
       @purchase_form.postal_code = ""
       @purchase_form.valid?
       expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
     end

     it "prefecture_idが1では購入できないこと" do
       @purchase_form.prefecture_id = 1
       @purchase_form.valid?
       expect(@purchase_form.errors.full_messages).to include("Prefecture must be other than 1")
     end

     it "cityが空では購入できないこと" do
       @purchase_form.city = ""
       @purchase_form.valid?
       expect(@purchase_form.errors.full_messages).to include("City can't be blank")
     end

     it "house_numが空では購入できないこと" do
      @purchase_form.house_num = ""
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("House num can't be blank")
    end

    it "phone_numが空では購入できないこと" do
      @purchase_form.phone_num = ""
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Phone num can't be blank")
    end

    it "postal_codeはハイフンがないと購入できないこと" do
      @purchase_form.postal_code = ""
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)", "Postal code can't be blank")
    end

    it "phone_numはハイフン不要で11桁以内でないと購入できないこと" do
      @purchase_form.phone_num = "090-00000000"
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Phone num is invalid. Input half-width characters.")
    end

    it "tokenが空では登録できないこと" do
      @purchase_form.token = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
    end
   end
  end
end