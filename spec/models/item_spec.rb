require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができない時' do
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '説明が空では登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end  
      it 'カテゴリーが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end  
      it '商品状態が空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end  
      it '配送料が空では登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end  
      it '発送元の地域が空では登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end  
      it '発送までの日数が空では登録できない' do
        @item.shipping_to_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping to date can't be blank")
      end  
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end  
      it 'idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end  
      it 'idが1だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end  
      it 'idが1だと登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end  
      it 'idが1だと登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end  
      it 'idが1だと登録できない' do
        @item.shipping_to_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping to date can't be blank")
      end  
      it '価格が300円未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end 
      it '価格が9,999,999円を超えると登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end 
      it '価格は半角で入力しないと登録できない' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end  

    context '商品出品できる場合' do
      it '適切なデータが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
  end    
end
