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
        expect(@item.errors.full_messages).to include("item name can't be blank")
      end
      it '説明が空では登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("content can't be blank")
      end  
      it 'カテゴリーが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("category id can't be blank")
      end  
      it '商品状態が空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("condition id can't be blank")
      end  
      it '配送料が空では登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("shipping fee id can't be blank")
      end  
      it '発送元の地域が空では登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("area id can't be blank")
      end  
      it '発送までの日数が空では登録できない' do
        @item.shipping_to_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("shipping to date id can't be blank")
      end  
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("price can't be blank")
      end  
      it 'idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("can't be blank")
      end  
      it 'idが1だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("can't be blank")
      end  
      it 'idが1だと登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("can't be blank")
      end  
      it 'idが1だと登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("can't be blank")
      end  
      it 'idが1だと登録できない' do
        @item.shipping_to_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("can't be blank")
      end  
      it '価格が300円未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end 
      it '価格が999,999円を超えると登録できない' do
        @item.price = 1_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end 
      it '価格は半角で入力しないと登録できない' do
        @item.price = ２０００
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end

    context '商品出品できる場合' do
      it '適切なデータが存在すれば登録できる' do
        expect(@item).to be_valid
      end
end
