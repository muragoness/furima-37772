require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep(1) 
  end

  describe '商品購入機能' do
    context '商品の購入ができる場合' do

      it '全ての項目が入力されていれば購入ができる' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @purchase_address.building_name = nil
        expect(@purchase_address).to be_valid
      end

    end

    context '商品が購入できない場合' do

      it 'token(クレジットカード情報)が空だと購入ができない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと購入ができない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.messages).to include("Postal code can't be blank", 'is invalid')
      end
      it '郵便番号にハイフンがないと登録できない' do
        @purchase_address.postal_code = '12345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'Prefectures_idが空だと購入できない' do
        @purchase_address.prefectures_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefectures can't be blank")
      end
      it '都道府県が選択されていないと購入できない' do
        @purchase_address.prefectures_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefectures must be other than 1')
      end
      it 'municipalitiesが空だと購入できない' do
        @purchase_address.municipalities = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'addressが空だと購入できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は数字のみでないと（ハイフンが含まれていると）購入できない' do
        @purchase_address.phone_number = '123-4567891'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上では購入できない' do
        @purchase_address.phone_number = '080123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が9桁以下では購入できない' do
        @purchase_address.phone_number = '080123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

    end
  end
end
