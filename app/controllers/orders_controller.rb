class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    if current_user.id == @item.user_id && @item.order != nil
      redirect_to root_path
    else
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入
    @purchase_form = PurchaseForm.new
    end
  end

  def create
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
    params.require(:purchase_form).permit(:order_id, :postal_code, :prefecture_id, :city, :house_num, :building_name, :phone_num).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:  @item.price,
      card: purchase_form_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end