require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do

    before do
      @user = FactoryBot.build(:user)
    end

    it "全ての値が正常であれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

     it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
     end

     it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     end

     it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
     end

     it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end

     it "birth_dateが空では登録できない" do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
     end

     it 'password:半角英数混合(半角英語のみ)' do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "aaaaaaa", password_confirmation: "00000000", last_name: "阿部", first_name: "太郎", last_name_kana: "アベ", first_name_kana: "タロウ", birth_date: "19990101")
      user.valid?
      expect(user.errors.full_messages).to include("Password Include both letters and numbers")
    end
   end
 end