require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Last name is invalid", "Last name kana is invalid", "First name is invalid", "First name kana is invalid")
    end
    it "パスワードが６文字以上であること" do
      @user.password = "asdf"
      @user.password_confirmation = "asdf"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードが必須であること" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは確認用を含めて二回入力すること" do
      user = FactoryBot.build(:user, password_confirmation: "") 
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it "パスワードは半角英数字混合であること" do
      @user.password = "1111111"
      @user.password_confirmation = "1111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password が半角英数字混合である必要がある")
      
    end
    it "last_nameがない場合は登録できないこと" do
        user = FactoryBot.build(:user, last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include("can't be blank", "is invalid")
      end

      it "last_name_kanaがない場合は登録できないこと" do
        user = FactoryBot.build(:user, last_name_kana: nil)
        user.valid?
        expect(user.errors[:last_name_kana]).to include("can't be blank", "is invalid")
      end

      it "first_nameがない場合は登録できないこと" do
        user = FactoryBot.build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank", "is invalid")
      end

      it "first_name_kanaがない場合は登録できないこと" do
        user = FactoryBot.build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include("can't be blank", "is invalid")
      end
    it 'family_nameが全角入力でなければ登録できないこと' do
      user = FactoryBot.build(:user, last_name: "ｱｲｳｴｵ") 
      user.valid?
      expect(user.errors[:last_name]).to include("is invalid")
    end

    it 'first_nameが全角入力でなければ登録できないこと' do
      user = FactoryBot.build(:user, first_name: "ｱｲｳｴｵ")
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end
    it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
      user = FactoryBot.build(:user, last_name_kana: "あいうえお") 
      user.valid?
      expect(user.errors[:last_name_kana]).to include("is invalid")
    end

    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      user = FactoryBot.build(:user, first_name_kana: "あいうえお") 
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end
    it "生年月日が必須であること" do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
