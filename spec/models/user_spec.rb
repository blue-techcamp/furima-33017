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
      @user.password = "a1234"
      @user.password_confirmation = "a1234"
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

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスは@を含まないと登録できないこと" do
      @user.email = "testexample"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "last_nameは漢字・平仮名・カタカナ以外では登録できないこと" do
      @user.last_name = "[a-z]\d!_-@"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end

    it "first_nameは漢字・平仮名・カタカナ以外では登録できないこと" do
      @user.first_name = "[a-z]\d!_-@"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end

    it "last_name_kanaは全角カタカナ以外では登録できないこと" do
      @user.last_name_kana = "[a-z]\d!_-@あ漢"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
    end

    it "first_name_kanaは全角カタカナ以外では登録できないこと" do
      @user.first_name_kana = "[a-z]\d!_-@あ漢"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
    end

    # it "passwordは英語のみでは登録できないこと" do

    # end

    # it "passwordは数字のみでは登録できないこと" do

    # end

    # it "passwordは全角では登録できないこと" do

    # end
   end
 end