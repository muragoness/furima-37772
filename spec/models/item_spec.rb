require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '全ての項目が入力されていれば出品ができる' do
        expect(@item).to be_valid
      end

      context '商品出品がうまくいかないとき' do
        it 'imageが空では登録されない' do
          @item.image = nil
          @item.valid?
          
          expect(@item.errors.added?(:image, :blank)).to be_truthy
        end
        it 'nameが空では登録されない' do
          @item.name = ''
          @item.valid?
          
          expect(@item.errors.added?(:name, :blank))
        end
        it 'explanationが空では登録されない' do
          @item.explanation = ''
          @item.valid?
          
          expect(@item.errors.added?(:explanation, :blank))
        end
        it 'category_idが空では登録されない' do
          @item.category_id = nil
          @item.valid?
          
          expect(@item.errors.added?(:category_id, :blank))
        end
        it 'condition_idが空では登録されない' do
          @item.condition_id = nil
          @item.valid?
         
          expect(@item.errors.added?(:condition_id, :blank))
        end
        it 'delivery_charge_idが空では登録されない' do
          @item.delivery_charge_id = nil
          @item.valid?

          expect(@item.errors.added?(:delivery_charge_id, :blank))
        end
        it 'prefectures_idが空では登録されない' do
          @item.prefectures_id = nil
          @item.valid?

          expect(@item.errors.added?(:prefectures_id, :blank))
        end
        it 'days_for_delivery_idが空では登録されない' do
          @item.days_for_delivery_id = nil
          @item.valid?
     
          expect(@item.errors.added?(:days_for_delivery_id, :blank))
        end
        it 'カテゴリーの情報が必須であること' do
          @item.category_id = 1
          @item.valid?
          
          expect(@item.errors.added?(:category_id, :mandatory))
        end
        it '商品の状態についての情報が必須であること' do
          @item.condition_id = 1
          @item.valid?
          
          expect(@item.errors.added?(:condition_id, :mandatory))
        end
        it '配送料の負担についての情報が必須であること' do
          @item.delivery_charge_id = 1
          @item.valid?
          
          expect(@item.errors.added?(:delivery_charge_id, :mandatory))
        end
        it '発送元の地域についての情報が必須であること' do
          @item.prefectures_id = 1
          @item.valid?
          
          expect(@item.errors.added?(:prefectures_id, :mandatory))
        end
        it '発送までの日数についての情報が必須であること' do
          @item.days_for_delivery_id = 1
          @item.valid?
   
          expect(@item.errors.added?(:days_for_delivery_id, :mandatory))
        end
        it 'priceが空では登録されない' do
          @item.price = ''
          @item.valid?
          
          expect(@item.errors.added?(:price, :blank))
        end
        it '価格は半角数字以外では登録できない' do
          @item.price = '１０００'
          @item.valid?
          
          expect(@item.errors.added?(:price, :nonber))
        end
        it '価格は300より少ないと登録できない' do
          @item.price = 299
          @item.valid?
         
          expect(@item.errors.added?(:price, :minimum))
        end
        it '価格は9999999より多いと登録できない' do
          @item.price = 1_000_000_000
          @item.valid?
         
          expect(@item.errors.added?(:price, :maximum))
        end

        it 'ユーザーが紐付いていなければ出品できない' do
          @item.user = nil
          @item.valid?
          
          expect(@item.errors.added?(:user, :linked))
        end
      end
    end
  end
end
