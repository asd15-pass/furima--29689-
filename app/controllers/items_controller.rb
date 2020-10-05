class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  def index
    @items =Item.order(id: :DESC)
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
  def show
    @item = Item.find(params[:id])
  end
  def edit
    @item=Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end




 private
   def item_params
   params.require(:item).permit(:name, :items_description,:image,:category_id,:condition_id,:shipping_payer_id,:price,:derivery_time_id,:consignor_id).merge(user_id: current_user.id)
  end
end