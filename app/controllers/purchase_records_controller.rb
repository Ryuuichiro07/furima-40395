class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create,]
  before_action :set_item, only: [:index, :create]

  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
   
    if current_user.id == @item.user.id || @item.purchase_record.present?
      redirect_to root_path
    end
  end


  def create
   
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_form_params
    # params.require(:order_form).permit(:user, :item,:post_code,:region_of_origin_id,:municipality,:street_address,:building,:telephone_number,:purchase_record).merge(user_id: current_user.id)
    params.require(:order_form).permit(:post_code,:region_of_origin_id,:municipality,:street_address,:building,:telephone_number).merge(user_id: current_user.id,item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_form_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
