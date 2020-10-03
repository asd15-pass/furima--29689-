require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
 
 describe '商品出品機能' do
      context '商品出品できる' do
        it"name,items_description,category_id,condition_id,shipping_payer_id,consignor_id,derivery_time_id,priceが存在すれば出品できる " do
           expect(@item).to be_valid
        end
      end
      context '商品出品できない' do
        it " 画像は1枚必須であること(ActiveStorageを使用すること)" do
          @item.image = nil
          @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
       end
        it "商品の説明が必須であること" do
          @item.items_description = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Items description can't be blank")
        end
        it "商品名が必須であること" do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it "カテゴリーの情報が必須であること" do
           @item.category_id = ""
           @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it "商品の状態についての情報が必須であること" do
          @item.condition_id= ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end
          it "配送料の負担についての情報が必須であること" do
            @item.shipping_payer_id= ""
            @item.valid?
            expect(@item.errors.full_messages).to include("Shipping payer can't be blank")
        end
          it "発送元の地域についての情報が必須であること" do
            @item.consignor_id= ""
            @item.valid?
            expect(@item.errors.full_messages).to include("Consignor can't be blank")
        end
          it "発送までの日数についての情報が必須であること" do
            @item.derivery_time_id= ""
            @item.valid?
            expect(@item.errors.full_messages).to include("Derivery time can't be blank")
        end
          it "価格についての情報が必須であること" do
            @item.price= nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it "価格の範囲が、¥300~¥9,999,999の間であること" do
          @item.price= "150"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
        it "価格が¥9,999,999超える時" do
          @item.price= "1111111111111111111111111"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
        it "販売価格は半角数字のみ保存可能であること" do
            @item.price= "１２３rt"
            @item.valid?
            expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
      end
  end
end