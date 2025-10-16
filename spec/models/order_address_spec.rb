require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it '全ての値が正しく入力されていれば保存できる' do
      expect(@order_address).to be_valid
    end

    it '建物名が空でも保存できる' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it '郵便番号が空では保存できない' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号が「3桁-4桁」以外では保存できない' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it '郵便番号が全角では保存できない' do
      @order_address.postal_code = '１２３−４５６７'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it '都道府県が未選択では保存できない' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が空では保存できない' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空では保存できない' do
      @order_address.house_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it '電話番号が空では保存できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が9桁以下では保存できない' do
      @order_address.phone_number = '090123456'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号が12桁以上では保存できない' do
      @order_address.phone_number = '090123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号にハイフンが含まれていると保存できない' do
      @order_address.phone_number = '090-1234-5678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号が全角では保存できない' do
      @order_address.phone_number = '０９０１２３４５６７８'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号に英字が含まれていると保存できない' do
      @order_address.phone_number = '090abcd1234'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'トークンが空では保存できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空では保存できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空では保存できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
