class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :info, :price, :category_id, :sale_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:new_item, keys: [:image, :name, :info, :price, :category_id, :sale_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id])
  end
end