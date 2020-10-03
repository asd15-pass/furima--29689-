class ItemsController < ApplicationController
  before_action :authenticate_user!,only: :new
  def index
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    
    if @item.valid?
      @item.save
      return redirect_to root_path
    end
      render :new
  end

 private
   def item_params
   params.require(:item).permit(:name, :items_description,:image,:category_id,:condition_id,:shipping_payer_id,:price,:derivery_time_id,:consignor_id).merge(user_id: current_user.id)
  end
end