class ItemsController < ApplicationController

before_action :authenticate_user!, only: [:new, :create]

def index
  @items = Item.order("created_at DESC")
end

def new
  @item = Item.new
end

def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end

private

def item_params
  params.require(:item).permit(:name, :explantion, :category_id, :situation_id,:delivery_charge_id, :region_of_origin_id, :number_of_days_until_shipping_id, :price,:image,).merge(user_id: current_user.id)
end

end
