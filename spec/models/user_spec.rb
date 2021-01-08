require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
     it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "阿部", first_name: "太郎", last_name_kana: "アベ", first_name_kana: "タロウ", birth_date: "19990101")
       user.valid?
       expect(user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000", last_name: "阿部", first_name: "太郎", last_name_kana: "アベ", first_name_kana: "タロウ", birth_date: "19990101")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
     it "passwordが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "", password_confirmation: "00000000", last_name: "阿部", first_name: "太郎", last_name_kana: "アベ", first_name_kana: "タロウ", birth_date: "19990101")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
     it "last_nameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "", first_name: "太郎", last_name_kana: "アベ", first_name_kana: "タロウ", birth_date: "19990101")
      user.valid?
      expect(user.errors.full_messages).to include("Last Name can't be blank")
     end
     it "first_nameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "阿部", first_name: "", last_name_kana: "アベ", first_name_kana: "タロウ", birth_date: "19990101")
      user.valid?
      expect(user.errors.full_messages).to include("First Name can't be blank")
     end
     it "last_name_kanaが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "阿部", first_name: "太郎", last_name_kana: "", first_name_kana: "タロウ", birth_date: "19990101")
      user.valid?
      expect(user.errors.full_messages).to include("Last Name Kana can't be blank")
     end
     it "first_name_kanaが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "阿部", first_name: "太郎", last_name_kana: "アベ", first_name_kana: "", birth_date: "19990101")
      user.valid?
      expect(user.errors.full_messages).to include("First Name Kana can't be blank")
     end
     it "birh_dateが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "阿部", first_name: "太郎", last_name_kana: "アベ", first_name_kana: "タロウ", birth_date: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birth Date can't be blank")
     end
   end
 end