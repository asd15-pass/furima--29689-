class OrdersController < ApplicationController
  before_action :set_item ,only:[:index,:create,:order]
  before_action :authenticate_user!
  before_action :top
  def index
    @order = UserInfo.new
  end

  def create
    @order = UserInfo.new(order_params)
    if @order.valid?
      order
      @order.save
      return redirect_to root_path
    else
      
      render 'index'
    end
  end
  private
  def order
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token] ,
      currency: 'jpy' # 通貨の種類（日本円）
      )
  end
  
  def order_params
    params.permit(:item_id,:postcode,:consignor_id,:phone_number, :city, :building_name,:consignor_code,:token).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
  def top
    if user_signed_in? && current_user.id == @item.user_id
      return redirect_to root_path
    end
    if @item.order != nil
      return redirect_to root_path
    end
  end
end
