require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '商品配送先情報の登録' do
    context '商品配送先情報の登録ができる時' do
      it '入力された情報が問題ない' do
        expect(@order_form).to be_valid
      end
    end

    context '商品配送先情報の登録ができない時' do
      it "tokenが空では登録できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空では登録できない' do
        @order_form.post_code = ' '
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Post code can't be blank", "Post code is invalid"
      end

      it 'post_codeは-がないと登録できない' do
        @order_form.post_code = '1234567 '
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Post code is invalid"
      end

      it 'post_codeが全角では登録できない' do
        @order_form.post_code = '１２３−４５６７'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Post code is invalid"
      end

      it 'region_of_origin_idが空白では登録できない' do
        @order_form.region_of_origin_id = ' '
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Region of origin can't be blank"
      end

      it 'municipalityが空白では登録できない' do
        @order_form.municipality = ' '
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Municipality can't be blank"
      end

      it 'street_addressが空白では登録できない' do
        @order_form.street_address = ' '
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Street address can't be blank"
      end

      it 'telephone_numberが空白では登録できない' do
        @order_form.telephone_number = ' '
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Telephone number can't be blank"
      end

      it 'telephone_numberが9桁では登録できない' do
        @order_form.telephone_number = '090123456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Telephone number is invalid"
      end

      it 'telephone_numberが12桁では登録できない' do
        @order_form.telephone_number = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Telephone number is invalid"
      end

      it 'telephone_numberが全角では登録できない' do
        @order_form.telephone_number = '０９０１２３４５６７８'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Telephone number is invalid"
      end

      it 'telephone_numberは - があると登録できない' do
        @order_form.telephone_number = '090-1234-5678 '
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Telephone number is invalid"
      end
    end  
  end  
end