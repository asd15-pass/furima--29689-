class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  VALID_PASSWORD_REGEX =/\A[-]?[0-9]+(\.[0-9]+)?\z/
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_payer
  belongs_to_active_hash :consignor
  belongs_to_active_hash :derivery_time

  belongs_to :user   
  has_one :order    
  has_one :purchase
  has_one_attached :image
  with_options presence: true do
    validates :name
    validates :items_description
    validates :category_id
    validates :condition_id
    validates :shipping_payer_id
    validates :consignor_id
    validates :derivery_time_id
    validates :image
    validates :price
  end
  with_options format: {with:/\A[-]?[0-9]+(\.[0-9]+)?\z/}   do
    validates :price    
  end       
  validates_inclusion_of :price,in: (300..9999999)
  validates :category_id,:condition_id,:shipping_payer_id,:consignor_id,:derivery_time_id, numericality: { other_than: 1 } 
  
end
