require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品' do
    context '商品出品ができる時' do
      it '入力された情報が問題ない' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない時' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it 'explantionが空では登録できない' do
        @item.explantion = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explantion can't be blank"
      end

      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'category_idが___では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'situation_idが空では登録できない' do
        @item.situation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Situation can't be blank"
      end

      it 'situation_idが___では登録できない' do
        @item.situation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Situation can't be blank"
      end

      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge can't be blank"
      end

      it 'delivery_charge_idが___では登録できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge can't be blank"
      end
      
      it 'region_of_origin_idが空では登録できない' do
        @item.region_of_origin_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Region of origin can't be blank"
      end

      it 'region_of_origin_idが___では登録できない' do
        @item.region_of_origin_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Region of origin can't be blank"
      end
      
      it 'number_of_days_until_shipping_idが空では登録できない' do
        @item.number_of_days_until_shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Number of days until shipping can't be blank"
      end

      it 'number_of_days_until_shipping_idが___では登録できない' do
        @item.number_of_days_until_shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Number of days until shipping can't be blank"
      end

      it 'priceが空では登録できない' do
        @item.price= ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが299では登録できない' do
        @item.price= '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it 'priceが10000000では登録できない' do
        @item.price= '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it 'priceが全角数値では登録できない' do
        @item.price= '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

     
    end


  end
end
