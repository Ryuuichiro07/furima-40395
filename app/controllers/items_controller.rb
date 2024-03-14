class ItemsController < ApplicationController

before_action :authenticate_user!, only: [:new, :create]
before_action :before_move_to_edit, only: :edit
before_action :set_item, only: [:show, :edit, :update]
  

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

def show
  
end

def edit
  
end

def update
  if @item.update(item_params)
      redirect_to item_path(@item)
  else
    render :edit, status: :unprocessable_entity
  end
end

private

def item_params
  params.require(:item).permit(:name, :explantion, :category_id, :situation_id,:delivery_charge_id, :region_of_origin_id, :number_of_days_until_shipping_id, :price,:image,).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end

def before_move_to_edit
  @item = Item.find(params[:id])
  unless user_signed_in? && @item.user == current_user
    redirect_to action: :index
  end
end


end
