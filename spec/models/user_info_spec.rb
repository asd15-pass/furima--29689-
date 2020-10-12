require 'rails_helper'

RSpec.describe UserInfo, type: :model do
    before do
      @seller = FactoryBot.create(:user)
      @buyer = FactoryBot.create(:user)
      @item  = FactoryBot.create(:item, user_id: @seller.id)
      @user_info = FactoryBot.build(:user_info, user_id:@buyer.id,item_id:@item.id)
      sleep(1)
    end
  describe '商品購入機能' do
      context '購入できる時' do
        it ":user_id, :item_id ,:postcode,:consignor_id,:phone_number,:city,:building_name,:token,:consignor_codeが当てはまる時" do
          expect(@user_info).to be_valid
        end
        it "building_nameがなくても購入できる" do
          @user_info.building_name  = ""
          expect(@user_info).to be_valid
        end
      end
    context '購入できない時' do
      it "配送先の情報として、郵便番号が（123-4567となる）必須であること " do
        @user_info.postcode  = ""
        @user_info.valid?
        expect(@user_info.errors.full_messages).to include("Postcode can't be blank", "Postcode にはハイフンが必要であること")
      end
      it "郵便番号にはハイフンが必要であること（123-4567となる）" do
        @user_info.postcode  = "1234567"
        @user_info.valid?
        expect(@user_info.errors.full_messages).to include("Postcode にはハイフンが必要であること")
      end
      it "配送先の情報として、電話番号が必須であること" do
        @user_info.phone_number = ""
        @user_info.valid?
        expect(@user_info.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号にはハイフンは不要であること" do
        @user_info.phone_number = "123−2345−2345"
        @user_info.valid?
        expect(@user_info.errors.full_messages).to include("Phone number 11桁以内であること")
      end
      it "電話番号は11桁以内であること" do
        @user_info.phone_number = "22222666666222222"
        @user_info.valid?
        expect(@user_info.errors.full_messages).to include("Phone number 11桁以内であること")
      end
      it "配送先の情報として、都道府県が必須であること" do
        @user_info.consignor_id    = ""
        @user_info.valid?
        expect(@user_info.errors.full_messages).to include("Consignor can't be blank")
      end
      it "配送先の情報として、都道府県が未選択以外であること" do
        @user_info.consignor_id    = "---"
        @user_info.valid?
        expect(@user_info.errors.full_messages).to include("Consignor is not a number")
      end
      it "配送先の情報として、市区町村が必須であること" do
        @user_info.city    = ""
        @user_info.valid?
        expect(@user_info.errors.full_messages).to include("City can't be blank")
      end
      it "配送先の情報として、番地が必須であること" do
        @user_info.consignor_code   = ""
        @user_info.valid?
        expect(@user_info.errors.full_messages).to include("Consignor code can't be blank")
      end
      it "トークンが必須であること" do
        @user_info.token   = ""
        @user_info.valid?
        expect(@user_info.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end



