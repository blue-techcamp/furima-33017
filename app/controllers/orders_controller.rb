class OrdersController < ApplicationController

  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new
  end
  
  def create
    # 値をDBへ保存する実装
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new(purchase_form_params)
    if @purchase_form.valid?
      # Payjp.api_key = "sk_test_100ca0870c099743aa59164f"
      # Payjp::Charge.create(
      #   amount: @item.price,  # 商品の値段
      #   card: purchase_form_params[:token],    # カードトークン
      #   currency: 'jpy'                 # 通貨の種類（日本円）
      # )
      pay_item
      @purchase_form.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_form_params
    params.require(:purchase_form).permit(:order_id, :postal_code, :prefecture_id, :city, :house_num, :building_name, :phone_num,:item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_100ca0870c099743aa59164f"
    Payjp::Charge.create(
      amount:  @item.price,  # 商品の値段
      card: purchase_form_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end