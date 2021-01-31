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
      @purchase_form.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_form_params
    params.permit(:order_id, :postal_code, :prefecture_id, :city, :house_num, :building_name, :phone_num,:item_id).merge(user_id: current_user.id)
  end

end