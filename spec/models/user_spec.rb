require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it '新規登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録がうまくいかない時' do


      it 'nicknameが空だと登録できない' do
    
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに一意性がないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは@を含まないと登録できない' do
        @user.email = 'example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '123qw'
        @user.password_confirmation = '123qw'
        @user.valid?
       
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end


      it 'passwordは半角数字だけでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end


      it 'passwordは半角英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end

      it 'passwordは半角英数字でないと登録できない' do
        @user.password = '123ｑｗｅ'
        @user.password_confirmation = '123ｑｗｅ'
        @user.valid?
        
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
     




      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameがない場合は登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
      end

      it 'first_nameがない場合は登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end
      it 'Last_nameが全角入力でなければ登録できない' do
        @user.last_name = 'wwwww'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが全角入力でなければ登録できない' do
        @user.first_name = 'wwwww'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない' do
        @user.last_name = "\bＡＡＡＡＡ"
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない' do
        @user.first_name = "\bＡＡＡＡＡ"
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_name_kanaがない場合は登録できないこと' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana is invalid')
      end
      it 'first_name_kanaがない場合は登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid')
      end
      it 'last_name_kanaが全角(カタカナ)入力でなければ登録できない' do
        @user.last_name_kana = 'ｱｲｳｴｵ'
        @user.valid? 
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kanaが全角(カタカナ)入力でなければ登録できない' do
        @user.first_name_kana = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it '生年月日がない場合は登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    

    end
  end
end
