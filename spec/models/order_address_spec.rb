require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do

    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '商品購入ができない時' do
      it '郵便番号が空では登録できない' do
        @order_address.zip_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
      end

      it '郵便番号が3桁ハイフン4桁の半角英数字ではないと登録できない' do
        @order_address.zip_code = '１２３４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end

      it '都道府県が空では登録できない' do
        @order_address.area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end

      it 'idが1だと登録できない' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end  

      it '市区町村が空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空では登録できない' do
        @order_address.tel = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")
      end

      it '電話番号が半角数字以外が含まれている場合は購入できない' do
        @order_address.tel = '０９０１２'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid")
      end

      it '9桁以下だと購入できない' do
        @order_address.tel = '090'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid")
      end

      it '12桁以上だと購入できない' do
        @order_address.tel = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid")
      end

      it 'ユーザーが紐づいていないと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it '商品が紐づいていないと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end

    context '商品出品できる場合' do
      it '適切なデータが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end

      it '建物名がからでも購入できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end  
    end
  end
end