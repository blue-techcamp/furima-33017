class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if current_user.id = @item.user_id
      redirect_to root_path
    else
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入
    @purchase_form = PurchaseForm.new
    end
  end

  def create
    # 値をDBへ保存
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new(purchase_form_params)
    if @purchase_form.valid?
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:  @item.price,
      card: purchase_form_params[:token],
      currency: 'jpy'
    )
  end
end