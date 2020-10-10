class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = UserInfo.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = UserInfo.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:item_id,:postcode,:consignor_id,:phone_number, :city, :building_name,:consignor_code,:token).merge(user_id: current_user.id)
  end
end
