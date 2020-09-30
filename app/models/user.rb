class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         has_many :purchases
         validates :email, uniqueness: { case_sensitive: true }
         validates :password, length:{ minimum: 6 },format: { with: VALID_PASSWORD_REGEX,
          message: "が半角英数字混合である必要がある"}
        with_options presence: true do
          validates :nickname
          validates :birth_date
          with_options format: {with: /\A[ぁ-んァ-ン一-龥]/ }  do
            validates :last_name           
            validates :first_name  
          end         
          with_options format: {with: /\A[ァ-ヶー－]+\z/ }   do
            validates :last_name_kana       
            validates :first_name_kana
          end       
        end
end
  