class OrdersController < ApplicationController

  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @purchase_address = PurchaseAddress.new
  end

  def create
    
  end

end