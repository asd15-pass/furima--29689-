class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :email, uniqueness: { case_sensitive: true }
  validates :password, length:{ minimum: 6 },format: { with: VALID_PASSWORD_REGEX,
    message: "が半角英数字混合である必要がある"}
  validates :last_name,              presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :last_name_kana,         presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
  validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
  validates :birth_date,             presence: true
end